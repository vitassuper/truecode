<template>
  <div class="container">
    <div>Edit post</div>
    <router-link to="/posts" class="btn btn-secondary">Back</router-link>
    <div>
      <form v-on:submit.prevent="saveForm()">
        <div class="row">
          <div class="col-xs-12 form-group">
            <label>Title</label>
            <input type="text" v-model="posts.title" />
            <button>Submit</button>
          </div>
        </div>
      </form>
    </div>
    <div v-if="postError">{{postError}}</div>
  </div>
</template>
<script>
import { editPost } from "../../helpers/posts";
export default {
  mounted() {
    let id = this.$route.params.id;
    this.postId = id;
    axios
      .get("/api/v1/posts/" + id)
      .then((resp) =>{
        this.post = resp.data;
      })
      .catch(()=> {
        alert("Could not load your company");
      });
  },
  data: function() {
    return {
      postId: null,
      posts: {
        title: ""
      }
    };
  },
  methods: {
    saveForm() {
      editPost(this.postId, this.posts)
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