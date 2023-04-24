
public with sharing class Accounts {

    private final List<Account> accounts;

    public Accounts(List<Account> accounts){
        this.accounts = accounts;
    }

    public void onApplyBeforeInsert(){
        for(Account acc : (List<Account>) accounts) {
            acc.Name = 'Test Trigger';
        }
    }
    public void onValidate(){
        for(Account acc : (List<Account>) accounts) {
            if(acc.Name == 'Test'){
                acc.addError('You cannot insert an account');
            }
        }
    }

}