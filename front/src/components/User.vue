<script>
export default {
    methods: {
        createUser() {
            console.log("Création utilisateur")
        },
        updateUser() {
            console.log("Update utilisateur")
        },
        //getAllUsers() {
          //      this.$emit('getAllUsers')
       // },
        deleteUser() {
            console.log("Delete utilisateur")
        }
    }
}
</script>

<template>
    <div>User : </div>
    <button type="button" @click='createUser()' class="btn btn-success">Create</button>
    <button type="button" @click='updateUser()' class="btn btn-warning">Update</button>
    <button type="button" @click='getAllUsers()' class="btn btn-info">Get</button>
    <button type="button" @click='deleteUser()' class="btn btn-danger">Delete</button>
</template>
<style>
.couleur {
    border: solid black 1px;
    display: inline-block;
}
</style>