public with sharing class GroupRepository {
    public static List<Grupo__c> getById(List<Id> ids) {
        return [
            SELECT Id, Nome__c, Permissoes__c
            FROM Grupo__c
            WHERE Id IN :ids
        ];
    }
}