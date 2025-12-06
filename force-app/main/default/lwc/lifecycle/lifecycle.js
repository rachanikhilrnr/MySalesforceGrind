import { LightningElement } from 'lwc';

export default class Lifecycle extends LightningElement {
    data;
    constructor(){
        super();
    }
    connectedCallback(){
        console.log('Fetching the data');
    }
    renderedCallback(){
        console.log('Rendering the data');
    }
    disconnectedCallback(){
        console.log('Disconnected the data');
    }
    errorCallback(){
        console.error('Error call back');
    }
}