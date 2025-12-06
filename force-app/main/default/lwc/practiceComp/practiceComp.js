import { LightningElement } from 'lwc';

export default class PracticeComp extends LightningElement {
    message = 'Hello!!';
    bool = true;

    firstname = 'nikhil';
    lastname = 'rn';

    msg;

    objects = [{name:'nikhil', age:23, gender:'male'}];

    onChange(event){
        this.message = event.target.value;
    }

    onToggle(){
        this.bool = !this.bool;
    }

    get fullname(){
        return this.firstname +' '+this.lastname;
    }

    handle(event){
        this.msg = event.detail.mesg;
        console.log(this.msg);
    }
    
}