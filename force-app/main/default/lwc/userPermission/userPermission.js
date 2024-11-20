import { LightningElement } from 'lwc';
import getPermissionsGroups from '@salesforce/apex/UserPermissionController.getPermissionsGroups';
import Id from '@salesforce/user/Id';

export default class UserPermissions extends LightningElement {
    permissions = [];
    selectedGroup = null; 
    error;

    connectedCallback() {
        this.loadPermissions();
    }

    loadPermissions() {
        getPermissionsGroups({ userId: Id })
            .then((result) => {

                this.permissions = Object.keys(result).map((key) => ({
                    name: key,
                    permissions: result[key]?.length ? result[key] : ['Esse grupo não tem permissões.']
                }));

                this.error = undefined;
            })
            .catch((error) => {
                console.error('Error loading permissions:', error);
                this.error = error;
                this.permissions = [];
            });
    }

    handleGroupClick(event) {
        try {
            const groupName = event.currentTarget.dataset.groupName;

            if (groupName) {
                this.selectedGroup = this.permissions.find((group) => group.name === groupName);
            } else {
                this.selectedGroup = null; 
                console.warn('Group name is missing in the event.');
            }
        } catch (error) {
            console.error('Error in handleGroupClick:', error);
            this.selectedGroup = null;
        }
    }
}