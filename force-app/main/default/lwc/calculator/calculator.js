import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {
    num1 = null;
    num2 = null;
    result = null;


    // functions

    addNum1(event){
        this.num1 = parseInt(event.target.value);
    }

    addNum2(event){
        this.num2 = parseInt(event.target.value);
    }

    sum(){
        this.result = this.num1 + this.num2;
    }

    sub(){
        this.result = this.num1 - this.num2;
    }

    mul(){
        this.result = this.num1 * this.num2;
    }

    div(){
        this.result = this.num1 / this.num2 ;
    }
}