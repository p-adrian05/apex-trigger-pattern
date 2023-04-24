
public with sharing abstract class TriggerHandlerImpl implements TriggerHandler{

    protected Integer triggerSize;
    protected Boolean triggerIsExecuting;

    public TriggerHandlerImpl() {
        triggerIsExecuting = Trigger.isExecuting;
        triggerSize = Trigger.size;
        if(triggerIsExecuting){
            executeTriggerContext();
        }
    }

    private void executeTriggerContext() {
        switch on Trigger.operationType {
            when BEFORE_INSERT {
                beforeInsert(Trigger.new);
            }
            when BEFORE_UPDATE {
                beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            }
            when BEFORE_DELETE {
                beforeDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_INSERT {
                afterInsert(Trigger.new, Trigger.newMap);
            }
            when AFTER_UPDATE {
                afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            }
            when AFTER_DELETE {
                afterDelete(Trigger.old, Trigger.oldMap);
            }
            when AFTER_UNDELETE {
                afterUndelete(Trigger.new, Trigger.newMap);
            }
        }
    }
    public abstract void beforeInsert(List<SObject> newRecords);
    public abstract void beforeUpdate(List<SObject> oldRecords, List<SObject> newRecords, Map<Id, SObject> oldRecordMap, Map<Id, SObject> newRecordMap);
    public abstract void beforeDelete(List<SObject> oldRecords, Map<Id, SObject> oldRecordMap);
    public abstract void afterInsert(List<SObject> newRecords, Map<Id, SObject> newRecordMap);
    public abstract void afterUpdate(List<SObject> oldRecords, List<SObject> newRecords, Map<Id, SObject> oldRecordMap, Map<Id, SObject> newRecordMap);
    public abstract void afterDelete(List<SObject> oldRecords, Map<Id, SObject> oldRecordMap);
    public abstract void afterUndelete(List<SObject> newRecords, Map<Id, SObject> newRecordMap);
}