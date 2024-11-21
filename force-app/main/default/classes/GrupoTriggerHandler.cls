public with sharing class GrupoTriggerHandler {
    private boolean m_isExecuting = false;
    private integer BatchSize = 0;
    public static boolean IsFromBachJob ;
    public static boolean isFromUploadAPI=false;
    
    public GrupoTriggerHandler(boolean isExecuting, integer size)
    {
        m_isExecuting = isExecuting;
        BatchSize = size;
    }

    public void OnBeforeInsert(List<Grupo__c> newGroups)
    {
        GrupoActions.formatsPermissions(newGroups);
    }
    public void OnAfterInsert(List<Grupo__c> newGroups)
    {
    }
    public void OnAfterUpdate( List<Grupo__c> newGroups, List<Grupo__c> oldGroups, Map<ID, Grupo__c> newGroupsMap , Map<ID, Grupo__c> oldGroupsMap )
    {
    }
    public void OnBeforeUpdate( List<Grupo__c> newGroups, List<Grupo__c> oldGroups, Map<ID, Grupo__c> newGroupsMap , Map<ID, Grupo__c> oldGroupsMap )
    {
    }

    @future 
    public static void OnAfterUpdateAsync(Set<ID> newGroupsIDs)
    {

    }      
    public boolean IsTriggerContext
    {
        get{ return m_isExecuting;}
    }
    
    public boolean IsVisualforcePageContext
    {
        get{ return !IsTriggerContext;}
    }
    
    public boolean IsWebServiceContext
    {
        get{ return !IsTriggerContext;}
    }
    
    public boolean IsExecuteAnonymousContext
    {
        get{ return !IsTriggerContext;}
    }
}