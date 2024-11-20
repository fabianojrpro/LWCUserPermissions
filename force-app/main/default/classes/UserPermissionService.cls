public with sharing class UserPermissionService {

    public static Map<String, List<String>> returnPermissions( Id userId ) {
        List<UsuarioGrupo__c> userGroup = UsuarioGrupoRepository.getByUserId(userId);

        List<Id> idsGroup = new List<Id>();
        for(UsuarioGrupo__c groupId : userGroup) {
            idsGroup.add(groupId.GrupoId__c);
        }

        List<Grupo__c> groups = GroupRepository.getById(idsGroup);

        Map<String, List<String>> mapGroups = splitPermissions(groups);

        return mapGroups;
    }

    private static Map<String, List<String>> splitPermissions( List<Grupo__c> groups ) {
        Map<String, List<String>> mapGroups = new Map<String, List<String>>();
        for(Grupo__c gp : groups) {
            if(!String.isBlank(gp.Permissoes__c)){
                Set<String> uniquePermissions = new Set<String>(gp.Permissoes__c.split(','));
                mapGroups.put(gp.Nome__c, new List<String>(uniquePermissions));
            } else {
                mapGroups.put(gp.Nome__c, new List<String>());
            }
        }
        return mapGroups;
    }
}