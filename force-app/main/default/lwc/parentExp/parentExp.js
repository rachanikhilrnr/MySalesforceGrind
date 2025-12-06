import { LightningElement } from 'lwc';

export default class ParentExp extends LightningElement {
    message ;
    handleClick(event){
        this.message = event.detail.message;
    }
}