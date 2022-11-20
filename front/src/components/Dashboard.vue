<template>
  <div class="hello">
    <Header />
    <div class="container mrgnbtm">
      <router-view @createUser="createUser($event)"> </router-view>
    </div>
  </div>
  <Footer />


</template>

<script>
import Header from './Header.vue'
import Footer from './Footer.vue'
import { createUser } from '../services/apiService'


export default {
  name: 'Dashboard',
  components: {
    Header,
    Footer
  },
  data() {
    return {
    }
  },
  methods: {
    createUser(data) {
      createUser(data).then(response => {
      });
    }
  },
  mounted() {
  },
}
</script>