import { LightningElement,api } from 'lwc';

export default class ChildComp extends LightningElement {
    @api message='message written in child component';
    handle(){
        const event = new CustomEvent('myevent',{detail:{mesg:'Hello from Child'}});
        this.dispatchEvent(event);
    }
}