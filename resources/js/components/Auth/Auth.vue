<template>
    <div v-if="currentUser">
      <p style="font-size:28px;">Приветствую <span class="text-success">{{currentUser.login}}</span></p>
      <a v-on:click="logout()" class="btn btn-info">Выход</a>
    </div>
    <div v-else class="font-weight-bold">
      <router-link :to="{name: 'register'}">Регистация</router-link>
      <router-link :to="{name: 'login'}" class="ml-3">Вход</router-link>
    </div>
</template>
    

<script>
export default {
  computed: {
    currentUser() {
      return this.$store.getters.currentUser;
    }
  },
  methods:{
      logout(){
        this.$store.commit('logout');
        this.$router.push('/posts');
      }
  }
};
</script>

<style>
    a{
        color: #000;
        font-size: 16px;
    }
</style>
