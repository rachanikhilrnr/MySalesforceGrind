import { LightningElement } from 'lwc';

export default class EMICalculator extends LightningElement {
    amount = null;
    tenure = null;
    tenuretoyr = null;
    interest = null;

    result = 0;
    totalpayable = 0;
    emi = 0;
    // functions
    addAmount(event){
        this.amount = parseInt(event.target.value);
    }

    addTenure(event){
        this.tenure = parseInt(event.target.value);
        this.tenuretoyr = this.tenure/12;
    }

    addInterest(event){
        this.interest = parseInt(event.target.value);
    }

    submit(){
        this.result = ((this.amount*this.tenuretoyr*this.interest)/100);
        this.totalpayable = this.result+this.amount;
        this.emi = this.totalpayable/this.tenure;
    }
}