//store/modules/auth.js

import axios from 'axios';
const state = {
  user: null,
  posts: null,
};

const getters = {
  isAuthenticated: (state) => !!state.user,
  StatePosts: (state) => state.posts,
  StateUser: (state) => state.user,
};
const actions = {

};
const mutations = {

};
export default {
  state,
  getters,
  actions,
  mutations
};
