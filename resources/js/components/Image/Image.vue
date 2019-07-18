<template>
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
          <div class="modal-body">
            <div class="d-flex align-items-center">
              <div v-for="image in images.data">
                <img :src="image.url" />
              </div>
              <button v-on:click="getImages(5)">Next</button>
            </div>
          </div>
          <div class="modal-footer">
            <form v-on:submit.prevent="uploadImage">
              <input id="file" type="file" name="image" />
              <button>Upload</button>
            </form>
            <button class="modal-default-button" @click="$emit('close')">OK</button>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
export default {
  data: function() {
    return {
      images: {
        url: ""
      },
      imgFile: {
        type: "local",
        width: "300",
        height: "300"
      },
    };
  },
  mounted() {
    this.getImages(1);
  },
  methods: {
    getImages(page) {
      axios
        .get("/api/v1/images?page=" +page)
        .then(resp => {
          this.images = resp.data;
        })
        .catch(err => {
          rej("Невозможно получить записи");
        });
    },
    uploadImage(e) {
      var bodyFormData = new FormData();
      bodyFormData.append("type", this.imgFile.type);
      bodyFormData.append("width", this.imgFile.width);
      bodyFormData.append("height", this.imgFile.height);
      bodyFormData.append("image", document.getElementById("file").files[0]);
      axios
        .post("/api/v1/images", bodyFormData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        })
        .then(resp => {
          
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>

<style>
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: table;
  transition: opacity 0.3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-container {
  width: 70%;
  margin: 0px auto;
  padding: 20px 30px;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.33);
  transition: all 0.3s ease;
  font-family: Helvetica, Arial, sans-serif;
}

.modal-default-button {
  float: right;
}

.modal-body {
  margin: 20px 0;
}

.modal-enter {
  opacity: 0;
}

.modal-leave-active {
  opacity: 0;
}

.modal-enter .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
</style>
