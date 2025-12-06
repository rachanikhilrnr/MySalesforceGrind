import { LightningElement, wire,api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import Name from '@salesforce/schema/Account.Name';
import Phone from '@salesforce/schema/Account.Phone';

export default class SingleRecord extends LightningElement {
    @api recordId = '001NS00000XkD2WYAV'; // Example record ID

    @wire(getRecord, { recordId: '$recordId', fields: [Name, Phone] })
    account;

    get accountName() {
        return this.account?.data?.fields.Name.value || 'N/A';
    }

    get accountPhone() {
        return this.account?.data?.fields.Phone.value || 'N/A';
    }
}