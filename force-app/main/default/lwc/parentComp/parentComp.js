import { LightningElement,api } from 'lwc';

export default class ParentComp extends LightningElement {
    @api value ;
    handle(event){
        this.value = event.detail.mesg;
    }
}