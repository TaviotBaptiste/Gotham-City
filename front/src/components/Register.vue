<template>
    <div class="divCenter col-6">
        <h2 class="textCenter">Register</h2>

        <form v-on:submit.prevent="submitForm">
            <div class="form-group">
                <label for="username">Username</label>
                <input class="form-control" type="text" v-model="username" name="username" id="username"
                    placeholder="Jon" required />
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input class="form-control" type="text" v-model="email" name="email" id="email"
                    placeholder="jon.doe@gmail.com" required />
            </div>
            <div class="form-group">
                <label htmlFor="password">Password</label>
                <input class="form-control" type="password" v-model="password" name="password" id="password" required />
            </div>
            <div class="form-group">
                <label class="textSize" for="confPassword">Confirm password :</label>
                <input class="form-control" type="text" v-model="confPassword" name="confPassword" id="confPassword"
                    required />
            </div>
            <br>
            <div>
                <span v-show="show" class="text-danger">Passwords don't match</span>
            </div>
            <div class="form-group divCenter">
                <button type="button" class="btn btn-primary" @click='createUser()'>Register</button>
            </div>
        </form>
    </div>
</template>

<script>
import { createUser } from '../services/apiService'

export default {
    data() {
        return {
            username: '',
            email: '',
            password: '',
            rank: '1'
        }
    },
    methods: {
        createUser() {
            const payload = {
                username: this.username,
                email: this.email,
                password: this.password,
                rank: this.rank
            }
            this.$emit('createUser', payload)
            this.clearForm();
        },
        clearForm() {
            this.username = "";
            this.email = "";
            this.password = "";
        }
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