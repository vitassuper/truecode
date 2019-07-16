<template>
  <div class="container">
    <div v-if="currentUser && currentUser.user_role=='admin'" class="mb-3">
      <router-link :to="{name: 'postCreate'}" class="btn btn-success">Create new post</router-link>
    </div>
    <div v-if="posts!=null">
      <div v-for="(post, index) in posts" style="margin-bottom:100px;">
        <div class="card">
          <div class="card-header">{{post.title}}</div>
          <div v-if="post.image"><img :src="post.image.url"></div>
          <div class="card-body">{{post.description}}</div>
          <div v-if="currentUser && currentUser.user_role=='admin'" class="col-2">
            <a class="btn btn-xs btn-danger" v-on:click.prevent="deleteEntry(post.id, index)">Delete</a>
            <router-link :to="{name: 'postEdit', params: {id: post.id}}" class="btn btn-info">Edit</router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
    

<script>
import { deletePost } from "../../helpers/posts";
import {getPosts} from "../../helpers/posts";

export default {
  data: function() {
    return {
      posts: [],
    };
  },
  mounted() {
    var i = 1;
    this.getPosts(1);
    window.onscroll = () => {
      const el = document.documentElement;
      const isbottomOfScreen =
        el.scrollTop + window.innerHeight === el.offsetHeight;
      if (isbottomOfScreen) {
        this.getPosts(i++);
      }
    };
  },
  beforeDestroy() {
    window.onscroll = null;
  },
  methods: {
    getPosts(page) {
        getPosts(page).then((resp)=>{
          this.$store.commit("getPostSuccess", resp);
           for (var i in resp.data) {
            this.posts.push(resp.data[i]);
          }
        })
        .catch((error)=> {
          this.$store.commit("getPostError", {error});
        });
    },
    deleteEntry(id, index) {
      deletePost(id)
        .then(resp => {
          this.$store.commit("deletePostSuccess", resp);
          this.posts.splice(index, 1);
        })
        .catch(error => {
          this.$store.commit("deletePostError", { error });
        });
    }
  },
  computed: {
    postError() {
      return this.$store.getters.postError;
    },
    currentUser() {
      return this.$store.getters.currentUser;
    }
  }
};
</script>

