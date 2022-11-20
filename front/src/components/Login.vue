<template>
    <div class="divCenter col-6">
        <h2 class="textCenter">Login</h2>
        <form v-on:submit.prevent="submitForm">
            <div class="form-group">
                <label for="email">Email</label>
                <input class="form-control" type="text" v-model="email" name="email" id="email"
                    placeholder="jon.doe@gmail.com" required />
            </div>
            <div class="form-group">
                <label htmlFor="password">Password</label>
                <input class="form-control" type="password" v-model="password" name="password" id="password" required />
            </div>
            <br>
        </form>
        <div class="row">
            <span class="col-4"></span>
            <button type="button" class="btn btn-primary col-4" @click='login()'>Login</button>
            <span class="col-4"></span>
        </div>
    </div>
</template>

<script>
import { loginUser } from '../utils/auth'
export default {
    name: 'login',
    data() {
        return {
            email: '',
            password: ''
        }
    },
    methods: {
        async login() {
            try {
                const data = await loginUser(this.email, this.password)
                this.$router.push('/')
            } catch (err) {
                alert(`Error: ${err}`)
            }
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