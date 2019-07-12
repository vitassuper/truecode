<template>
  <div>
  <form v-on:submit="authenticate()">
    <input type="text" name="login" v-model="auth.login" />
    <label>Login</label>
    <input type="password" name="pass" v-model="auth.password" />
    <label>Password</label>
    <button>Войти</button>
  </form>
  <div v-if="authError">
      <p class="error">{{ authError }}</p>
    </div>
  </div>
</template>

<script>
import {login} from '../../helpers/auth';

export default {
  data: function() {
    return {
      auth: {
        login: "",
        password: ""
      }
    };
  },
  methods: {
    authenticate(){
       event.preventDefault();
      login(this.auth).then((resp)=> {
          this.$store.commit("loginSuccess", resp);
          this.$router.push({ path: "/posts" });
        })
        .catch((error)=> {
           this.$store.commit("loginFailed", {error});
        });
    }
  },
  computed:{
    authError(){
        return this.$store.getters.authError;
    }
  }
};
</script>
