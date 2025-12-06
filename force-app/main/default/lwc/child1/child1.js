import { LightningElement } from 'lwc';

export default class Child1 extends LightningElement {

    childHandle(){
        const event = new CustomEvent('myevent',{detail:{mesg:'Child Message'}});
        this.dispatchEvent(event);
    }
}