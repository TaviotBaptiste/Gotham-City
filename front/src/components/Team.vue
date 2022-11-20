<template>
    <div v-if="+rank === 1">
        <div class="container team-container">
            <div class="team-header">
                <h1>My Team :{{ team.teamname }}</h1>
            </div>
            <div class="team-body">
                <ul v-for="user in team" :key="user.id" class="list-group">
                    <div class="list-group-item d-flex justify-content-between align-items-center">
                        {{ user.username }}
                    </div>
                </ul>
            </div>
        </div>
    </div>
    <div v-else-if="rank === '5' || rank === '10'">
        <div class="container team-manager-container">
            <div class="team-manager-content">
                <div class="team-header">
                    <h1>All Teams</h1>
                </div>
            </div>
            <div class="team-manager-content">
                <div class="team-header">
                    <h1>My Team
                        <span class="icon-button">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-person-plus" viewBox="0 0 16 16">
                                <path
                                    d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                                <path fill-rule="evenodd"
                                    d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z" />
                            </svg>
                        </span>
                    </h1>
                </div>
                <div class="team-body">

                    <ConfirmPopup></ConfirmPopup>
                    <ConfirmPopup group="demo">
                        <template #message="slotProps">
                            <div class="flex p-4">
                                <i :class="slotProps.message.icon" style="font-size: 1.5rem"></i>
                                <p class="pl-2">{{ slotProps.message.message }}</p>
                            </div>
                        </template>
                    </ConfirmPopup>
                    <Toast />

                    <ul v-for="user in team" :key="user.id" class="list-group">
                        <div class="list-group-item d-flex justify-content-between align-items-center">
                            {{ user.username }}
                            <span @click="confirmBeforeDelete($event, user)" class="icon-button">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-person-x-fill" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                        d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z" />
                                </svg>
                            </span>
                        </div>
                    </ul>
                </div>
            </div>

        </div>
    </div>

</template>

<script setup>
import axios from 'axios';
import { onMounted, ref } from 'vue';
import ConfirmPopup from 'primevue/confirmpopup';
import Toast from 'primevue/toast';
import { useConfirm } from "primevue/useconfirm";
import { useToast } from "primevue/usetoast";



let team = ref([]);
const rank = ref("");
const confirm = useConfirm();
const toast = useToast();

const confirmBeforeDelete = (event, targetuser) => {
    confirm.require({
        target: event.currentTarget,
        message: `Do you want to remove ${targetuser.username} from the team?`,
        icon: 'pi pi-info-circle',
        acceptClass: 'p-button-danger',
        accept: () => {
            try {
                deleteFromTeam(targetuser.id);
                toast.add({ severity: 'info', summary: 'Confirmed', detail: 'You have accepted', life: 3000 });
            } catch (error) {
                console.log(error)
            }
        }
    })
}


onMounted(() => {
    getUser();
    const token = localStorage.getItem('token');
    const config = { headers: { 'Authorization': 'Bearer ' + token } }
    axios
        .get('http://localhost:4000/api/users', config) //change users to teams
        .then(response => {
            //console.log(response);
            team.value = response.data.data;
            //console.log(team.value)
        })
        .catch(error => console.log("erreur : " + error))
})

function getUser() {
    const token = localStorage.getItem('token');
    const config = { headers: { 'Authorization': 'Bearer ' + token } }
    axios.get('http://localhost:4000/api/token/', config)
        .then(response => {
            console.log(response.data.data.rank);
            rank.value = response.data.data.rank;
        })
        .catch(error => console.log("erreur : " + error))
}

function deleteFromTeam(userID) {
    const updatedTeam = team.value.filter(el => el.id !== userID);
    console.log("filtered team : " + JSON.stringify(updatedTeam));
    const token = localStorage.getItem('token');
    const config = { headers: { 'Authorization': 'Bearer ' + token } }
    axios
        .put(`http://localhost:4000/api/teams/${team.value.id}`, updatedTeam, config)
}


</script>

<style>
.team-container {
    padding-left: 20%;
    padding-right: 20%;
}

.team-header {
    background-color: rgb(200, 200, 200);
    border-radius: 10px 10px 0 0;
}

.team-body {
    background-color: rgb(233, 233, 233);
    border-radius: 0 0 10px 10px;
}

.team-item {
    display: flex;
}

.team-member {
    display: flex;
    justify-content: center;
}

.team-manager-container {
    display: flex;
    gap: 20px;
}

.team-manager-content {
    flex: 1;
}

.icon-button:hover {
    cursor: pointer;
}

@media screen and (max-width: 480px) {
    .team-manager-container {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
}
</style>