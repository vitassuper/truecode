<template>
  <div class="container mb-3">
    <div class="d-flex justify-content-between align-items-center">
        <router-link :to="{name: 'home'}"><img v-bind:src="url" style="max-width:100px;" /></router-link>
        <Menu></Menu>
      <Auth></Auth>
    </div>
  </div>
</template>

<script>
import Auth from "./Auth/Auth";
import Menu from "./Menu/Menu.vue";
export default {
    
  data: function() {
    return {
      url: ""
    };
  },
   mounted() {
       this.getLogo();
   },
   components:{
       Auth, 
       Menu
   },
   methods:{
       getLogo(){
      axios
        .get("/api/v1/header?type=logo")
        .then((resp)=> {
            this.url=resp.data;
        })
        .catch((resp) =>{
          console.log(resp);
        });
    }
   }
};
</script>
<style>
</style>
