import { LightningElement } from 'lwc';

export default class ChildComponent extends LightningElement {
    cvalue;

    handleChange(event) {
        this.cvalue = event.target.value;
    }

    handleMessage() {
        this.dispatchEvent(new CustomEvent("sendingmessage", {
            detail: { message: this.cvalue }
        }));
    }
}
