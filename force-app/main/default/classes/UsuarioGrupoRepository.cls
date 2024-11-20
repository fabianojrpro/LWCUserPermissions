public with sharing class UsuarioGrupoRepository {
    public static List<UsuarioGrupo__c> getByUserId(Id userId) {
        return [
            SELECT Id, UserId__c, GrupoId__c
            FROM UsuarioGrupo__c
            WHERE UserId__c = :userId
        ];
    }
}