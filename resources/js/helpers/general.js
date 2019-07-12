export function initialize(store, router){
    router.beforeEach((to,from, next)=>{
        const requiresAuth = to.matched.some(record=>record.meta.requiresAuth);
        const currentUser = store.state.currentUser;
        if(requiresAuth && !currentUser) {
            next('/auth/login');
        } else if(to.path == '/auth/login' && currentUser) {
            next('/');
        } else {
            next(); 
        }
    });


    axios.interceptors.response.use(null, (error) => {
    if (error.resposne.status == 401) {
        store.commit('logout');
        router.push('/auth/login');
    }
    return Promise.reject(error);
});
if (store.getters.currentUser) {
    const token = store.getters.currentUser.api_token;
    axios.defaults.headers.common["Authorization"] = `Bearer ${token}`;
}
}
