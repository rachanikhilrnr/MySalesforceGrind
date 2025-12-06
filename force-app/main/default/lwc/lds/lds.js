import { LightningElement, api } from 'lwc';
import Name from '@salesforce/schema/Contact.Name';
import email from '@salesforce/schema/Contact.Email'
export default class lds extends LightningElement {
    @api objectApiName = 'Contact';
    @api recordId = '003NS00000FJoEzYAL';
    @api fields = [Name,email];
}