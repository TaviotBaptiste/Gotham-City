<template>
    <div class="header">
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">Gotham City</div>
            <!-- <div class="textSize col-1 align-self-center btn btn-outline-dark">Connexion</div> -->
            <div class="textSize col-1 align-self-center">
                <button class="btn btn-outline-dark dropdown-toggle" type="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    profile
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" v-show="this.hide" href="#" @click="logout()">Logout</a></li>
                    <li><a class="dropdown-item" v-show="this.admin" href="/admin">Admin</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="d-flex justify-content-center header-menu">
        <router-link to="/board" class="header-item">Board</router-link>
        <router-link to="/team" class="header-item">Team</router-link>
        <router-link to="/profile" class="header-item">Profile</router-link>
        <router-link to="/admin" class="header-item">Admin</router-link>

    </div>

</template>

<script>
import { RouterLink } from 'vue-router';
import { logoutUser, isLoggedIn } from '../utils/auth'
export default {
    data() {
        return {
            hide: this.hide,
            admin: false
        }
    },
    name: "Header",
    components: { RouterLink },
    methods: {
        logout() {
            try {
                logoutUser()
                this.$router.push('/login')
            } catch (err) {
                alert(`Error: ${err}`)
            }
        }
    },
    beforeMount() {
        this.hide = isLoggedIn()
    },
}
</script>
<style>
.textSize {
    font-size: small;
}

.header-menu {
    gap: 5%;
    font-size: 20px;
    background-color: rgb(230, 228, 228);
}

.header-item {
    color: black;
    padding-top: 10px;
    padding-left: 5px;
    padding-right: 5px;
    border-radius: 0 0 10px 10px;
    margin-bottom: 10px;
    text-decoration: none;
}

.router-link-active {
    background-color: rgb(240, 240, 240);
}
</style>