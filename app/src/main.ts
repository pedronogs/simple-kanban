import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import axios from 'axios';
import VueAxios from 'vue-axios';
import { Quasar } from 'quasar';
import quasarUserOptions from './quasar-user-options';

const app = createApp(App).use(Quasar, quasarUserOptions).use(router).use(VueAxios, axios)
app.provide('axios', app.config.globalProperties.axios) 
app.mount("#app")
