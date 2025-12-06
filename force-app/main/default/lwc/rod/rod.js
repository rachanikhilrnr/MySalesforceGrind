// import Name from '@salesforce/schema/Account.Name';
// import Phone from '@salesforce/schema/Account.Phone';
import Name from '@salesforce/schema/Account.Name';
import Phone from '@salesforce/schema/Account.Phone';
import getAccounts from '@salesforce/apex/FetchAccounts.getAccounts'
import { LightningElement,wire,api } from 'lwc';

export default class Rod extends LightningElement {
    accounts ;
    handleClick(){
        getAccounts()
            .then(result => {
                this.accounts = result
            }).catch(error => {
                console.log(error);
            })
    }
    
    
    
    
    
    // @api accounts;

    // @wire(getAccounts) 
    // wireHandle({data,error}){
    //     if(data){
    //         this.accounts = data.map(acc => ({
    //             id:acc.Id, // Case sensitive
    //             name:acc.Name, // Case sensitive
    //             phone:acc.Phone // Case sensitive
    //         }));
    //     }else if(error){
    //         console.log(error);
    //     }
    // }
    
    
    // wiredHandle({data,error}){
    //     if(data){
    //         this.accounts = data.map(account => ({
    //             id: account.Id,
    //             name: account.Name,
    //         }));
    //     }else if(error){ 
    //         console.log(error);
    //     }
    // }

    




    // @api recordId = '001NS00000XkD2WYAV';
    // @wire(getRecord, { recordId: '$recordId', fields: [Name, Phone] })
    // account;

    // get accountName() {
    //     return this.account?.data?.fields.Name.value || 'N/A';
    // }

    // get accountPhone() {
    //     return this.account?.data?.fields.Phone.value || 'N/A';
    // }
}