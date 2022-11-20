<template>
    <div class="container window">
        <div class="row">
            <div class="col-6">
                <h2 class="textCenter">Informations</h2>

                <div class="form-group">
                    <label class="textSize" for="username">Username : {{ this.data.response["data"]["data"]["username"]
                    }}
                    </label>

                </div>
                <div class="form-group">
                    <label class="textSize" for="email">Email : {{ this.data.response["data"]["data"]["email"]
                    }}</label>
                </div>

                <div class="form-group">
                    <label class="textSize" for="email">Rank : {{ this.rank }} </label>
                </div>
            </div>
            <div class="col-6">
                <h2 class="textCenter">Password</h2>

                <form v-on:submit.prevent="submitForm">
                    <div class="form-group">
                        <label class="textSize" for="password">Password :</label>
                        <input class="form-control" type="password" v-model="password" name="password" id="password"
                            autocomplete="on" required />
                    </div>
                    <div class="form-group">
                        <label class="textSize" for="confPassword">Confirm password :</label>
                        <input class="form-control" type="password" v-model="confPassword" name="confPassword"
                            id="confPassword" autocomplete="on" required />
                    </div>
                    <br>
                    <div>
                        <span v-show="show" class="text-danger">Passwords don't match</span>
                    </div>
                </form>
            </div>

        </div>

        <div class="row">
            <button type="button" class="btn btn-danger col-2" @click='deleteUser()'>Delete</button>
            <span class="col-8"></span>
            <button type="button" class="btn btn-primary col-2" @click='updateUser()'>Modify</button>
        </div>
    </div>
</template>

<script>
import { logoutUser } from '../utils/auth'
import axios from 'axios';
export default {
    data() {
        return {
            data: {
                response: null,
            },
            show: false,
            password: this.password,
            rank: this.rank
        }
    },
    methods: {
        async getUser() {
            try {
                const token = localStorage.getItem('token');
                const config = { headers: { 'Authorization': `Bearer ${token}` } }
                const response = await axios.get('http://localhost:4000/api/token/', config)
                if (response.status === 200) {
                    this.data.response = await response;
                    return response.data
                }
            } catch (err) {
                console.log(err)
                return false;
            }
        },
        async deleteUser() {
            try {
                const token = localStorage.getItem('token');
                const config = { headers: { 'Authorization': `Bearer ${token}` } }
                await axios.delete('http://localhost:4000/api/users/' + this.data.response['data']['data']['id'], config)
                logoutUser()
                this.$router.push('/login')
            } catch (err) {
                console.log(err)
            }
        },
        async showUser() {
            try {
                this.getUser()
            } catch (err) {
                console.log(err)
            }
            if (this.data.response["data"]["data"]["rank"] == "1")
                this.rank = "User"
            else if (this.data.response["data"]["data"]["rank"] == "5")
                this.rank = "Manager"
            else if (this.data.response["data"]["data"]["rank"] == "10")
                this.rank = "Super-Manager"
            else
                this.rank = "Erreur"


        },
        updateUser() {
            if (this.password == this.confPassword) {
                var data = {
                    "user": {
                        "password": this.password
                    }
                };
                const token = localStorage.getItem('token')
                var req = {
                    method: 'put',
                    url: 'http://localhost:4000/api/users/' + this.data.response['data']['data']['id'],
                    headers: { 'Authorization': `Bearer ${token}` },
                    data: data
                };
                axios(req)
                logoutUser()
                this.$router.push('/login')
            }
            else {
                this.show = true
            }
        }
    },
    beforeMount() {
        this.showUser()
    }
}
</script>
<style>
.window {
    height: 100%;
}

.divCenter {
    position: fixed;
    left: 50%;
    transform: translate(-50%, 0);
}

.textCenter {
    text-align: center;
}

.textSize {
    font-size: 20px;
}
</style>