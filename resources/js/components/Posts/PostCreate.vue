<template>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">Create new post</div>
            <div class="panel-body">
                <form v-on:submit.prevent="saveForm()">
                    <div class="row">
                        <div class="col-xs-12 form-group">
                            <label class="control-label">Title</label>
                            <input type="text" v-model="posts.title" class="form-control">
                            <button class="btn btn-success">submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
         <div class="form-group">
            <router-link to="/posts" class="btn btn-secondary">Back</router-link>
        </div>
    </div>
</template>

<script>
    export default {
        data: function () {
            return {
                posts: {
                    title: '',
                }
            }
        },
        methods: {
            saveForm() {
                axios.post('/api/v1/posts', this.posts)
                    .then(function (resp) {
                        this.$router.push({path: '/posts'});
                    })
                    .catch(function (resp) {
                        console.log(resp);
                        alert("Could not create your post");
                    });
            }
        }
    }
</script>