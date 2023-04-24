
public with sharing class Accounts {

    private final List<Account> accounts;

    public Accounts(List<Account> accounts){
        this.accounts = accounts;
    }

    public void executeBusinessLogic(){
        //do something
        System.debug('Execute business logic on Accounts');
        for(Account acc : (List<Account>) accounts) {
            acc.Name = 'Test Trigger';
        }
    }

}