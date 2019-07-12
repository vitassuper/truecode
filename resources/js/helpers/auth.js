export function login(credentials){
    return new Promise((res, rej)=>{
        axios
        .post("/api/auth/login", credentials)
        .then((resp)=> {
          axios.defaults.headers.common["Authorization"] = `Bearer ${resp.headers.authorization}`
          res(resp.data);
        })
        .catch((err)=> {
           rej("Неправильный логин или пароль");
    });
});
}

export function register(credentials){
    return new Promise((res,rej)=>{
        axios.post('/api/auth/register', credentials)
            .then((resp)=>{
               res(resp.data);
    }).catch((err)=>{
        rej("Пароль или логин введены неправильно");
    });
});
}

export function getLocalUser(){
    const userStr = localStorage.getItem("user");
    if(!userStr){
        return null;
    }
    return JSON.parse(userStr);
}