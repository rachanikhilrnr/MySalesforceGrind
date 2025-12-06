import { LightningElement,api } from 'lwc';

export default class Parent1 extends LightningElement {
    @api value='Parent Message';
    parentHandle(event){
        this.value = event.detail.mesg;
    }
}