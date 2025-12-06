import { LightningElement } from 'lwc';

export default class ChildoneExp extends LightningElement {
    handleClick(event){
        const cusevent = new CustomEvent('myevent',{detail:{message:'Hello'}});
        this.dispatchEvent(cusevent);
    }
}