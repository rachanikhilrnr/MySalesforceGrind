import { api, LightningElement, track } from 'lwc';

export default class Component2 extends LightningElement {
    num1 = 0;
    num2 = 0;
    sumval = null;
    subval = null;
    mulval = null;
    divval = null;
    val = null;
    addNum1(event){
        this.num1 = parseFloat(event.target.value);
    }
    addNum2(event){
        this.num2 = parseFloat(event.target.value);
    }
    addNum1Task2(event){
        this.num1 = parseFloat(event.target.value);
    }
    addNum2Task2(event){
        this.num2 = parseFloat(event.target.value);
    }
    sum(){
        this.sumval = (this.num1+this.num2);
        this.val = (this.num1+this.num2)
    }
    sub(){
        this.subval = (this.num1-this.num2);
        this.val = (this.num1-this.num2)
    }
    mul(){
        this.mulval = (this.num1*this.num2);
        this.val = (this.num1*this.num2);
    }
    div(){
        this.divval = (this.num1/this.num2);
        this.val = (this.num1/this.num2);
    }
    // bool = false;
    
    // toggle(event){
    //     this.bool = !this.bool;
    // }

    // @track users =[
    //     {name:'user1',age:32},
    //     {name:'user2',age:53}
    // ];
    
    // message = 'This is component 2';
    // values = [
    //     {name:'nikhil'},
    //     {name:'siva'},
    //     {name:'sathwik'}
    // ]
}