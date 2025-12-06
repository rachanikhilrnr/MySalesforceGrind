import { LightningElement } from 'lwc';

export default class Acc3 extends LightningElement {
    toggle = true;

    activity(){
        this.toggle = true;
    }

    chatter(){
        this.toggle = false;
    }
}