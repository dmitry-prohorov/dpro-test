global with sharing class JSPWebService {
//ppppppppppppppppppppppppppppppppppppppp
	public class WebServiceException extends Exception {
	}

	public JSPWebService() {
	}

	private Set<String> talentWiseStatusSet {
		get {
			Set<String> availableList = new Set<String>{
				'Not Started',
				'New',
				'In Progress',
				'Complete',
				'Canceled'
			};
			return availableList;
		}
		set;
	}

	webservice static String ProcessRequest(String inputString) {
		String ServiceResponse = '{Status}';
		try {
			if (String.isBlank(inputString)) {
				throw new WebServiceException('Error: Input String can\'t be a NULL');
			}
			JSPWebService jspWS = new JSPWebService();
			Map<String,Object> rp_request = jspWS.parse(inputString);
			jspWS.saveTWResult(rp_request);

			ServiceResponse = ServiceResponse.replace('{Status}', 'Success');
			return ServiceResponse;
		}
		catch (WebServiceException e) {
			ServiceResponse = ServiceResponse.replace('{Status}', e.getMessage());
			return ServiceResponse;
		}
		catch (Exception e) {
			ServiceResponse = ServiceResponse.replace('{Status}', 'Internal webservice error: ' + e.getMessage());
			return ServiceResponse;
		}
	}

	private Map<String,Object> parse(String toParse) {
		toParse = toParse.unescapeXml();

		DOM.Document doc = new DOM.Document();
		doc.load(toParse);
		DOM.XMLNode WSRequest = doc.getRootElement();
		if (WSRequest == NULL) {
			throw new WebServiceException('Error: Root XML node is NULL.');
		}

		Map <String,String> XMLRequest = new Map <String,String>();
		for (Dom.XMLNode child : WSRequest.getChildElements()) {
			XMLRequest.put(child.getName(), child.getText());
		}

		//required fields validation
		if (String.isBlank(XMLRequest.get('orderStatusShort')) || !talentWiseStatusSet.contains(XMLRequest.get('orderStatusShort'))) {
			throw new WebServiceException('Error: orderStatusShort is NULL or contains invalid value');
		}
		if (String.isBlank(XMLRequest.get('ResultURL'))) {
			throw new WebServiceException('Error: ResultURL is NULL');
		}
		if (String.isBlank(XMLRequest.get('ReferenceId'))) {
			throw new WebServiceException('Error: ReferenceId is NULL');
		}
		if (String.isBlank(XMLRequest.get('RequestorEmail'))) {
			throw new WebServiceException('Error: RequestorEmail is NULL');
		}

		Map<String,Object> rp_request = new Map<String,Object> {
			'orderStatus' => XMLRequest.get('orderStatusShort').replaceAll(' ',''),
			'resultStatus' => XMLRequest.get('resultStatusShort'),
			'candidateReport' => XMLRequest.get('ResultURL'),
			'clientCandidateId' => XMLRequest.get('ReferenceId'),
			'candidateEmail' => XMLRequest.get('RequestorEmail')
		};

		return rp_request;
	}

	private void saveTWResult(Map<String,Object> rp_request) {
		String contactEmail = (String) rp_request.get('candidateEmail');
		String referenceId = (String) rp_request.get('clientCandidateId');
		Contact checkCandidateByReferenceId = new Contact();
		Contact candidate = new Contact();
		try {
			checkCandidateByReferenceId = [SELECT LastName, email FROM Contact WHERE LastName =: referenceId];
			if (checkCandidateByReferenceId.email != contactEmail) {
				throw new WebServiceException('Error: ReferenceId must be unique. ' + referenceId + ' is related to other contact.');
			}
		}
		catch (QueryException e) {
		}
		try {
			candidate = [SELECT FirstName, LastName, Description FROM Contact WHERE email =: contactEmail LIMIT 1];
		}
		catch (QueryException e) {
			throw new WebServiceException('Error: Contact with ' + contactEmail + ' is not found');
		}
		candidate.Description = (String) rp_request.get('orderStatus');
		candidate.FirstName = (String) rp_request.get('candidateReport');
		candidate.LastName = (String) rp_request.get('clientCandidateId');

		update candidate;
	}
}