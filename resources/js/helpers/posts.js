export function deletePost(id){
    return new Promise((res, rej)=>{
        axios
        .delete("/api/v1/posts/" + id).then((resp)=>{
            res(resp);
        })
        .catch((err)=> {
           rej("Недостаточно прав для удаления");
    });
});
}

export function editPost(id, data){
    return new Promise((res, rej)=>{
        axios.patch('/api/v1/posts/' + id, data)
        .then((resp) =>{
            res(resp.data);
        })
        .catch((err)=> {
            rej("Невозможно обновить");
        });
    })
}

export function getPost(id){
    return new Promise((res, rej)=>{
        axios.get("/api/v1/posts/" + id)
        .then((resp) =>{
            res(resp.data);
        })
        .catch((err)=> {
            rej("Невозможно получить данные о посте");
        });
    })
}

export function getPosts(page){
    return new Promise((res, rej)=>{
        axios
        .get("/api/v1/posts?page=" + page)
        .then((resp)=> {
            res(resp.data);
        })
        .catch((err)=> {
            rej("Невозможно получить записи");
        });
    });
}
