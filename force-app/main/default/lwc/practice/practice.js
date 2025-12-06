import { LightningElement, track } from 'lwc';

export default class MyComponent extends LightningElement {
  
  value = 'Nikhil';

  onClick(event){
    this.value = event.target.value; 
  }
}