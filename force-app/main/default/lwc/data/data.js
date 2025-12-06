import { LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import Name from '@salesforce/schema/Account.Name';
import Phone from '@salesforce/schema/Account.Phone';

export default class Data extends LightningElement {
    recordId = '001NS00000XkD2WYAV'; // Example Account ID

    @wire(getRecord, { recordId: '$recordId', fields: [Name, Phone] })
    account;

}