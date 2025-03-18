import { LightningElement } from 'lwc';

export default class ChildComponent extends LightningElement {
    handleClick(){
        this.dispatchEvent(new CustomEvent("clickevent", {detail:{message:"Hello from Child!"}}));
    }
}