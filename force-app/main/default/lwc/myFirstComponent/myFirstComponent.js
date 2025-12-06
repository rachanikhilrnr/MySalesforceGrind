import { LightningElement } from 'lwc';

export default class MyFirstComponent extends LightningElement {

    contacts = [
        {
            Id: '003171931112854375',
            Name: 'Amy Taylor',
            Title: 'VP of Engineering'
        },
        {
            Id: '003192301009134555',
            Name: 'Michael Jones',
            Title: 'VP of Sales'
        },
        {
            Id: '003848991274589432',
            Name: 'Jennifer Wu',
            Title: 'CEO'
        }
    ];
    // name = 'rachanikhil';
    // myfun(event){
    //     this.name=event.target.value;
    // }


    // firstName='';
    // lastName='';
    // handleChange(event) {
    //     const field = event.target.name;
    //     if (field === "firstName") {
    //       this.firstName = event.target.value;
    //     } else if (field === "lastName") {
    //       this.lastName = event.target.value;
    //     }
    //   }
    
    // get uppercasedFullName() {
    //     return `${this.firstName} ${this.lastName}`.toUpperCase();
    // }
}