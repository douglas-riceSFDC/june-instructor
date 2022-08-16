import { LightningElement, api, wire } from 'lwc';

export default class TestComponent extends LightningElement {
    @api recordId;

    testProperty = 'test';

    connectedCallback() {
        this.testFunction('testInput');
    }

    testFunction(event) {
        console.log(event);
    }
}