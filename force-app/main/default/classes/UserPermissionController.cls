public with sharing class UserPermissionController {

    @AuraEnabled
    public static Map<String, List<String>> getPermissionsGroups( Id userId ){
        try {
            return UserPermissionService.returnPermissions(userId);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}