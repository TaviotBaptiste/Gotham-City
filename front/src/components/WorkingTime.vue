<script>
export default {
    methods: {
        createWorkingTime() {
            console.log("Création Time")
        },
        updateWorkingTime(){
            console.log("Update Time")
        },
        deleteWorkingTime() {
            console.log("Delete Time")
        }
    }
}
</script>
<template>

<div>WorkingTime : </div>
<button type="button" @click='createWorkingTime()' class="btn btn-success">Create</button>
<button type="button" @click='updateWorkingTime()' class="btn btn-warning">Update</button>
<button type="button" @click='deleteWorkingTime()' class="btn btn-danger">Delete</button>
</template>
<style>
</style>