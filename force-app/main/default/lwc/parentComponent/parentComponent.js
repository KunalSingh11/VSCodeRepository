import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    displayText = "No message recieved yet...";
    clickHandler(event){
        this.displayText = event.detail.message;
    }
}