global class mainPackage {

    global interface secondPackageInterface {
        Boolean createContact(Contact cont);
    }
    
    global class secondPackage implements secondPackageInterface {
        global Boolean createContact(Contact cont) {
            try {
                insert cont;
                return true;
            }
            catch (Exception e) {
                return false;
            }
        }
    }
    
    global static String createMainContact(Contact cont) {
        try{
            Boolean isExternalPackage = true;
            String externalPackage = 'sectp.secondPackage';
            
            Type classType = Type.forName(externalPackage);
            if (classType == NULL) {
                return 'Second package is not available';
            }
            
            mainPackage.secondPackageInterface secondPackageInstance = (mainPackage.secondPackageInterface) classType.newInstance();
            if (secondPackageInstance == NULL) {
                return 'Unable to create the instance of secondPackageInstance ';
            }
            
            Boolean checkResult = secondPackageInstance.createContact(cont);
            
            if (checkResult) {
                return 'Contact was created';
            }
            
            return 'Contact was not created';
            
        }
        catch (Exception e) {
            return 'Exception' + e;
        }
    }
    
    global static Map<String, Object> invoke(String method, List<String> options) {
        Map<String, object> result = new Map<String, Object>();
        if (method == 'sayHello') {
            result.put('result', sayHello());
        }
        return result;
        
    }
    
    public static String sayHello() {
        return 'Hello';
    }
    
    global static void increment() {
        integer a= 0;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;        
        a ++;
        a ++;
        a ++;
        a ++;       
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;        
        a ++;
        a ++;
        a ++;
        a ++;       
        a ++;
        a ++;
        a ++;a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;        
        a ++;
        a ++;
        a ++;
        a ++;       
        a ++;
        a ++;
        a ++;a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;
        a ++;        
        a ++;
        a ++;
        a ++;
        a ++;       
        a ++;
        a ++;
        a ++;
    }

}