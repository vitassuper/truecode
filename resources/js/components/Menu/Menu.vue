<template>
  <ul class="nav">
    <li class="nav-item">
      <router-link :to="{name: 'home'}" class="nav-link">Home</router-link>
    </li>
    <li class="nav-item">
      <router-link :to="{name: 'postItem'}" class="nav-link">About us</router-link>
    </li>
    <li class="nav-item">
      <router-link :to="{name: 'postCreate'}" class="nav-link">Contacts</router-link>
    </li>
  </ul>
</template>

<script>
export default {
  data: function() {
    return {
      active: ""
    };
  },
};
</script>

<style>
.activem {
  color: green;
}
</style>
