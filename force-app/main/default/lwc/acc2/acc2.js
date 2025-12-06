import { LightningElement } from 'lwc';

export default class Acc2 extends LightningElement {
    toggle = true;
    RelatedFun(){
        this.toggle = true;
    }

    DetailsFun(){
        this.toggle = false;
    }

}