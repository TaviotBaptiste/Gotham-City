<template>
    <div class="container window">


        <div class="row">
            <div class="col-6">
                <h2 class="textCenter">List of users</h2>
                <br>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Username</th>
                            <th scope="col">Email</th>
                            <th scope="col">Rank</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="user of users">
                            <th>{{ user.id }}</th>
                            <td>{{ user.username }}</td>
                            <td>{{ user.email }}</td>
                            <td>{{ user.rank }}</td>
                            <td class="text-danger" @click="this.deleteUser(user.id)"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-trash" viewBox="0 0 16 16">
                                    <path
                                        d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                    <path fill-rule="evenodd"
                                        d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                </svg></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-6">
                <h2 class="textCenter">Register</h2>
                <br>
                <form v-on:submit.prevent="submitForm">
                    <div class="form-group">
                        <label class="textSize" for="username">Username</label>
                        <input class="form-control" type="text" v-model="username" name="username" id="username"
                            placeholder="Jon" required />
                    </div>
                    <div class="form-group">
                        <label class="textSize" for="email">Email</label>
                        <input class="form-control" type="text" v-model="email" name="email" id="email"
                            placeholder="jon.doe@gmail.com" required />
                    </div>
                    <div class="form-group">
                        <label class="textSize" htmlFor="password">Password</label>
                        <input class="form-control" type="password" v-model="password" name="password" id="password"
                            autocomplete="on" required />
                    </div>
                    <div class="form-group">
                        <label class="textSize" for="confPassword">Confirm password :</label>
                        <input class="form-control" type="password" v-model="confPassword" name="confPassword"
                            id="confPassword" autocomplete="on" required />
                    </div>
                    <div class="form-group">
                        <label class="textSize" for="rank">Rank {{this.rank}}</label>
                        <select class="form-control" v-model="rank" name="rank" id="rank" required >
                            <option value="1" selected>User</option>
                            <option value="5">Manager</option>
                            <option value="10">Super-Manager</option>
                        </select>
                    </div>
                    <br>
                    <div>
                        <span v-show="fromError" class="text-danger">Error bad value(s)</span>
                        <span v-show="passVali" class="text-success">User has been create</span>
                    </div>
                </form>
                <div class="row">
                    <span class="col-10"></span>
                    <button type="button" class="btn btn-primary col-2" @click="createUser()">Register</button>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import { createUser } from '../services/apiService'
import axios from 'axios';

export default {
    name: 'Dashboard',
    data() {
        return {
            username: null,
            email: null,
            password: null,
            confPassword: null,
            rank: "1",
            fromError: false,
            passVali: false,
            dtName: null,
            users: []

        }
    },
    methods: {
        createUser() {
            if (this.password == this.confPassword && this.username != null && this.email != null && this.rank != null) {
                const payload = {
                    username: this.username,
                    email: this.email,
                    password: this.password,
                    rank: this.rank
                }
                this.$emit('createUser', payload)
                this.passVali = true
                this.fromError = false
                this.clearForm();
            }
            else {
                this.fromError = true
                this.passVali = false
            }
        },
        clearForm() {
            this.username = "";
            this.email = "";
            this.password = "";
            this.confPassword = "";
            this.rank = "";
        },
        async showAllUser() {
            const token = localStorage.getItem('token');
            const config = { headers: { 'Authorization': `Bearer ${token}` } }
            const response = await axios.get('http://localhost:4000/api/users/', config)
            if (response.status === 200) {
                this.users = await response.data.data;
                return response.data
            }
        },
        async deleteUser(id) {
            try {
                const token = localStorage.getItem('token');
                const config = { headers: { 'Authorization': `Bearer ${token}` } }
                await axios.delete('http://localhost:4000/api/users/' + id, config)
                window.location.reload(true);
            } catch (err) {
                console.log(err)
            }
        },
    },
    beforeMount() {
        this.showAllUser()


    },
    mounted() {
    }
}
</script>
<style>
.divCenter {
    position: fixed;
    left: 50%;
    transform: translate(-50%, 0);
}

.textCenter {
    text-align: center;
}
</style>