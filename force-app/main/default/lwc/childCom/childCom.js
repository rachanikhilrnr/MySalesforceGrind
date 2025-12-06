import { LightningElement,api } from 'lwc';

export default class ChildCom extends LightningElement {
    @api mesg = 'Nothing to do with me';

    handleEvent(){
        const event = new CustomEvent('event',{detail:{mesg:'hello world'}});
        this.dispatchEvent(event);
    }
    
}