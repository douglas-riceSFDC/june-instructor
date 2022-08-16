import { LightningElement, api } from 'lwc';
import getProject from '@salesforce/apex/ProjectController.getProject';

export default class ExampleContainer extends LightningElement {
    @api recordId;

    project;

    connectedCallback() {
        getProject({ projectId: this.recordId })
            .then(projectResponse => {
                this.project = projectResponse;
            })
            .catch(error => {
                console.warn(error);
            });
    }
}