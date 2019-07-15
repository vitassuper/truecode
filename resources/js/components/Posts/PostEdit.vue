<template>
  <div class="container">
    <div>Edit post</div>
    <router-link to="/posts" class="btn btn-secondary">Back</router-link>
      <form v-on:submit.prevent="saveForm()">
        <div class="row">
          <div class="col-xs-12 form-group">
            <label>Title</label>
            <input type="text" v-model="posts.title" />
            <button>Submit</button>
          </div>
        </div>
      </form>
    <div v-if="postError">{{postError}}</div>
  </div>
</template>
<script>
import { editPost } from "../../helpers/posts";
import { getPost } from "../../helpers/posts";
export default {
  mounted() {
    getPost(this.$route.params.id)
      .then(resp => {
        this.$store.commit("editPostSuccess", resp);
        this.posts = resp;
      })
      .catch(error => {
        this.$store.commit("editPostError", { error });
      });
  },
  data: function() {
    return {
      posts: {
        title: ""
      }
    };
  },
  methods: {
    saveForm() {
      editPost(this.$route.params.id, this.posts)
        .then(resp => {
          this.$store.commit("editPostSuccess", resp);
          this.$router.replace("/posts");
        })
        .catch(err => {
          this.$store.commit("editPostFailed", { error });
        });
    }
  },
  computed: {
    postError() {
      return this.$store.getters.postError;
    }
  }
};
</script>