import PostCreate from "./components/Posts/PostCreate.vue";
import PostEdit from "./components/Posts/PostEdit.vue";
import PostIndex from "./components/Posts/PostIndex.vue";
import Login from "./components/Auth/login.vue";
import Register from "./components/Auth/register.vue";
import PostItem from "./components/Posts/PostItem.vue";
import Home from "./components/Home.vue"

export const routes = [
    {
        path: '/posts', 
        component: PostIndex, 
        children:[
            {
                path: 'edit/:id', component: PostEdit, name: 'postEdit'
            },
            {
                path: 'create', component: PostCreate, name: 'postCreate'
            },
            {
                path: '/', component: PostItem, name: 'postItem'
            }
        ]
    },
    {
        path: '/auth/login', component: Login, name: 'login'
    },
    {
        path: '/auth/register', component: Register, name: 'register'
    },
    {
        path: '/', component: Home, name: 'home'
    }
]