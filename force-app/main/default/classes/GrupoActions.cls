public with sharing class GrupoActions {

    public static void formatsPermissions(List<Grupo__c> newGroups) {
        for (Grupo__c gp : newGroups) {
            if (String.isNotBlank(gp.Permissoes__c)) {
                List<String> permissions = gp.Permissoes__c.split(',');
                for (Integer i = 0; i < permissions.size(); i++) {
                    permissions[i] = permissions[i].trim().capitalize();
                }
                gp.Permissoes__c = String.join(permissions, ',');
            }
        }
    }
}