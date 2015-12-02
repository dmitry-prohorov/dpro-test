public with sharing class TestRecordsControler {
/*
	private static final String PCODE_ENDPOINT = 'https://psp1m.jobscience.com/passcode';
	private static final String ENDPOINT = 'https://psp1m.jobscience.com/';
	private static final String SET_COOKIE = 'Set-Cookie';
	private static final String COOKIE = 'Cookie';
	private static final Integer TIMEOUT = 60000;

	public List<Record> responseData { get; set; }

	public class Record {
		public String Name { get; set; }
		public String Company { get; set; }
		public String Title { get; set; }
		public String Education { get; set; }
		public String CreatedDate { get; set; }
		public String Email { get; set; }
	}
	public TestRecordsControler() {
		HttpRequest req = new HttpRequest();
		req.setTimeout(TIMEOUT);
		req.setMethod('POST');
		req.SetHeader('Content-Type', 'application/x-www-form-urlencoded');
		req.setEndpoint(PCODE_ENDPOINT);
		req.setBody('passcode=JSsupersearch2014!');
		Http http = new Http();
		HttpResponse response = NULL;
		response = http.send(req);
		String cookieValue = response.getHeader(SET_COOKIE);
		Pattern p = Pattern.compile('pcode=([^;]*)');
		Matcher m = p.matcher(cookieValue);
		String pcode = NULL;
		String ctoken = NULL;
		String org = 'org=64demo;';
		String searchResponse = NULL;
		if (m.find()) {
			pcode = m.group(1);
		}
		system.debug('\n####'+pcode);
		if (pcode != NULL) {
			req = new HttpRequest();
				req.setTimeout(60000);
				req.setMethod('POST');
				req.SetHeader('Content-Type', 'text/html');
				req.SetHeader(COOKIE, 'pcode='+pcode+';'+org);
				req.setEndpoint(ENDPOINT);
				http = new Http();
				response = NULL;
				response = http.send(req);
				p = Pattern.compile('ctoken=([^;]*)');
				cookieValue =response.getHeader(SET_COOKIE);
				system.debug('####'+cookieValue);
				m = p.matcher(cookieValue);
				if (m.find()) {
					ctoken = m.group(1);
				}
				system.debug('\n####'+ctoken);
		}
		if (ctoken != NULL) {
			req = new HttpRequest();
				req.setTimeout(60000);
				req.setMethod('GET');
				req.SetHeader(COOKIE, 'pcode='+pcode+';'+org+'ctoken='+ctoken);
				req.setEndpoint('https://psp1m.jobscience.com/search?searchValues=%7B%22q_search%22%3A%22java%22%2C%22q_objectType%22%3A%22All%22%2C%22q_status%22%3A%22All%22%2C%22q_customFields%22%3A%5B%5D%7D&searchColumns=contact%2Cskill%2Ceducation%2Ccompany&searchMode=power&searchModeChange=false&skillOperator=O&companyOperator=O&pageIndex=1&pageSize=15');
				http = new Http();
				response = NULL;
				response = http.send(req);
				searchResponse = response.getBody();
				system.debug('$$$$$$$'+searchResponse);
		}
		responseData = new List<Record>();
		if (searchResponse != NULL) {
			responseData = parseJSON(searchResponse);
			system.debug('\n### responseData - '+responseData);
		}
	}

	public List<Record> parseJSON(String jsonStr) {
		List<Record> result = new List<Record>();
		Map<String, Object> perf = (Map<String, Object>) JSON.deserializeUntyped(jsonStr);
		Map<String, Object> resultsMap = (Map<String, Object>) perf.get('result');
		List<Object> resultsList = (List<Object>) resultsMap.get('result');
		for (Object obj : resultsList) {
			Record rec = new Record();
			Map<String, Object> item = (Map<String, Object>) obj;
			rec.Name = (String) item.get('name');
			rec.Company = (String) item.get('company');
			rec.Title = (String) item.get('title');
			rec.Education = (String) item.get('education');
			rec.CreatedDate = (String) item.get('createddate');
			rec.Email = (String) item.get('email');
			result.add(rec);
		}
		return result;
	}*/
	@RemoteAction
	public static String testtt(String st) {
		Contact c = new Contact();
		insert c;
		return '';
	}
}