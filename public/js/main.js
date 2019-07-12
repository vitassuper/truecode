
Vue.component('posts-list',{
  props:['posts'],
  template:'<div><div v-for="post in posts" :key="post.id">{{post}}</div></div>',
})

var app = new Vue({
    el: '#app',
    template:'<posts-list :posts="posts"/>',
    data: {
      posts: '',
    }
  })


axios.post('/post')
  .then((response)=>{app.posts = response.data.json()});
