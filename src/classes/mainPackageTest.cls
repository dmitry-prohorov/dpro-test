@isTest
private class mainPackageTest {
    public static testmethod void test1() {
        mainPackage.increment();
        System.assert(true, true);
    }
}