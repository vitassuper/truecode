import {getLocalUser} from "./helpers/auth";
const user = getLocalUser();
export default {
    state: {
        auth_error: null,
        currentUser: user,
        isLoggedIn: !!user,
        post_error:null,
    },
    getters: {
        authError(state) {
            return state.auth_error;
        },
        currentUser(state){
            return state.currentUser;
        },
        isLoggedIn(state){
            return state.isLoggedIn;
        },
        postError(state){
            return state.post_error;
        },
    },
    mutations: {
        loginSuccess(state, playload) {
            state.auth_error = null;
            state.isLoggedIn = true;
            state.currentUser = Object.assign({},playload.user, {user_role:playload.user_role}, {expires_in:playload.expires_in});
            localStorage.setItem("user", JSON.stringify(state.currentUser));
            const token = state.currentUser.api_token;
            axios.defaults.headers.common["Authorization"] = `Bearer ${token}`;
        },
        loginFailed(state, playload) {
            state.auth_error = playload.error;
        },
        registerSuccess(state, playload){
            state.auth_error = null;
        },
        registerFailed(state, playload){
            state.auth_error = playload.error;
        },
        logout(state) {
            localStorage.removeItem("user");
            state.isLoggedIn = false;
            state.currentUser = null;
        },
        deletePostError(state, playload){
            state.post_error = playload.error;
        },
        deletePostSuccess(state, playload){
           state.post_error=null;
        },
        editPostError(state, playload){
            state.post_error=playload.error;
        },
        editPostSuccess(state, playload){
            state.post_error=null;
        },
        getPostError(state, playload){
            state.post_error=playload.error;
        },
        getPostSuccess(state, playload){
            state.post_error=null;
        }
    }
}