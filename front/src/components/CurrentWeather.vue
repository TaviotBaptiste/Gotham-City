<script>
export default {
    data() {
        return {
            ville: 'Annecy',
            temperature: '34',
            date: '26 Octobre 2022'
        }
    }
}
</script>
<template>
    <div class="element">
        <select></select>
        <div>Test</div>
    </div>
    <div class="element">
        <div>Météo actuelle à {{ ville }}</div>
        <div>Temperature : {{ temperature }}°C</div>
        <div>Date : {{ date }}</div>
    </div>
</template>
<style>
* {
    margin: Opx;
    padding: 0px;
}

div {
    text-align: center;
    color: black;
}

.element {
    border: solid 1px white;
    background-color: white;
    margin: 0 auto;
    width: 300px;
    height: 100px;
    margin-bottom: 10px;
}
</style>