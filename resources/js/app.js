/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');



import VueRouter from 'vue-router';

import headercomp from './components/Header-component.vue'

import {routes} from './routes';
import Vuex from "vuex";
import StoreData from "./store";
import {initialize} from './helpers/general';

window.Vue.use(VueRouter);
window.Vue.use(Vuex);

const store = new Vuex.Store(StoreData);


const router = new VueRouter({
    linkExactActiveClass: "activem",
    mode: 'history',
    routes
});

initialize(store, router);

const app = new Vue({
    components:{
        headercomp
    },
    router,
    store
}).$mount('#app');
