

public with sharing class AccountTriggerHandler extends TriggerHandlerImpl {


    public AccountTriggerHandler() {
        super();
    }

    public override void beforeInsert(List<SObject> newRecords) {
        System.debug('Account before insert trigger called');
        System.debug(newRecords);
        Accounts accounts = new Accounts(newRecords);
        accounts.onApplyBeforeInsert();
    }

    public override void beforeUpdate(List<SObject> oldRecords, List<SObject> newRecords, Map<Id, SObject> oldRecordMap, Map<Id, SObject> newRecordMap) {
    }

    public override void beforeDelete(List<SObject> oldRecords, Map<Id, SObject> oldRecordMap) {
    }

    public override void afterInsert(List<SObject> newRecords, Map<Id, SObject> newRecordMap) {
        System.debug('Account after insert trigger called');
        System.debug(newRecordMap.values());
    }

    public override void afterUpdate(List<SObject> oldRecords, List<SObject> newRecords, Map<Id, SObject> oldRecordMap, Map<Id, SObject> newRecordMap) {
    }

    public override void afterDelete(List<SObject> oldRecords, Map<Id, SObject> oldRecordMap) {
    }

    public override void afterUndelete(List<SObject> newRecords, Map<Id, SObject> newRecordMap) {
    }
}