<template>
  <div class="container">
    <div>Edit post</div>
    <router-link to="/posts" class="btn btn-secondary">Back</router-link>
    <div class="row">
      <form v-on:submit.prevent="saveForm()">
        <label>Title</label>
        <input type="text" v-model="post.title" class="w-100" />
        <label>Description</label>
        <input type="text" v-model="post.description" class="w-100" />
        <button class="btn btn-success">Submit</button>
      </form>
    </div>
    <div v-if="post.image">
      <img :src="post.image.url" />
      <button class="button" v-on:click="deletePostImage()">delete</button>
    </div>
    <div v-if="postError">{{postError}}</div>
    <button id="show-modal" @click="showModal = true">Show Modal</button>
    <ImageWindow v-if="showModal" @close="showModal = false"></ImageWindow>
  </div>
</template>
<script>
import { editPost } from "../../helpers/posts";
import { getPost } from "../../helpers/posts";
import ImageWindow from "../Image/Image";
export default {
  mounted() {
    getPost(this.$route.params.id)
      .then(resp => {
        this.$store.commit("editPostSuccess", resp);
        this.post = resp;
      })
      .catch(error => {
        this.$store.commit("editPostError", { error });
      });
  },
  data: function() {
    return {
      post: {},
      showModal: false
    };
  },
  components: {
    ImageWindow
  },
  methods: {
    saveForm() {
      editPost(this.$route.params.id, this.post)
        .then(resp => {
          this.$store.commit("editPostSuccess", resp);
          this.$router.replace("/posts");
        })
        .catch(err => {
          this.$store.commit("editPostFailed", { error });
        });
    },
    deletePostImage() {
      this.post.image_id = null;
      this.post.image = null;
    }
  },
  computed: {
    postError() {
      return this.$store.getters.postError;
    }
  }
};
</script>