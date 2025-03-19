import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    receivedMessage = '';

    handleM(event) {
        this.receivedMessage = event.detail.message;
    }
}
