/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 *
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class Testt {

 static testMethod void JSPWebServiceTest() {
		Contact contact_item = new Contact(FirstName = 'test', LastName = 'test', email = 'test@test.test');
		insert contact_item;
		String InputXMLString = (
			'<results><serviceProvider>TalentWise</serviceProvider>' +
			'<orderStatusShort>Complete</orderStatusShort>' +
			'<resultStatusShort>Complete</resultStatusShort>' +
			'<ResultURL>https://www.testlink.com/test?id=123</ResultURL>' +
			'<ReferenceId>77777_3BBB1E44-BB33-2C3F-8592800D5E95C1D3</ReferenceId>' +
			'<RequestorEmail>test@test.test</RequestorEmail></results>'
		);

		Test.startTest();
		String Response = JSPWebService.ProcessRequest(InputXMLString);
		Test.stopTest();

		System.assertEquals(Response, 'Success');
	}
}