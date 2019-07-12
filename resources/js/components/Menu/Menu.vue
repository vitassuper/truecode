<template>
  <ul class="nav">
    <li class="nav-item" v-on:click="makeActive('home')">
      <router-link :to="{name: 'home'}" class="nav-link" :class="{actveitem:isActive('home')}">Home</router-link>
    </li>
    <li class="nav-item" v-on:click="makeActive('about')">
      <router-link :to="{name: 'postItem'}" class="nav-link"  :class="{actveitem:isActive('about')}">About us</router-link>
    </li>
    <li class="nav-item" v-on:click="makeActive('contacts')">
      <router-link :to="{name: 'postItem'}" class="nav-link" :class="{actveitem:isActive('contacts')}">Contacts</router-link>
    </li>
  </ul>
</template>

<script>
export default {
  data: function() {
    return {
      active: "home"
    };
  },
  methods: {
    makeActive: function(item){
        this.active = item;
    },
    isActive: function(item){
        return this.active===item;
    }
  }
};
</script>

<style>
.actveitem {
  color: green;
}
</style>
