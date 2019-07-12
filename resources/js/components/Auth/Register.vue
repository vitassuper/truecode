<template>
  <div>
    <form v-on:submit.prevent="register()">
      <input type="text" name="login" v-model="auth.login" />
      <label>Login</label>
      <input type="password" name="pass" v-model="auth.password" />
      <label>Password</label>
      <input type="password" name="pass_confirm" v-model="auth.password_confirmation" />
      <label>Confirm Password</label>
      <button>Зарегистрироваться</button>
    </form>
    <div v-if="authError">
      <p class="error">{{ authError }}</p>
    </div>
  </div>
</template>

<script>
import {register} from '../../helpers/auth';
export default {
  data: function() {
    return {
      auth: {
        login: "",
        password: "",
        password_confirmation: ""
      }
    };
  },
  methods: {
    register() {
      register(this.auth).then((resp)=> {
          this.$store.commit("registerSuccess", resp);
          this.$router.push({ path: "/posts" });
        })
        .catch((error)=> {
           this.$store.commit("registerFailed", {error});
        });
    }
  },
  computed: {
    authError() {
      return this.$store.getters.authError;
    }
  }
};
</script>
