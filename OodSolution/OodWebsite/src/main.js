import Vue from 'vue';
import App from './App.vue';
import VueRouter from './router/main-router.js';

Vue.config.productionTip = true;

new Vue({
    VueRouter,
    render: h => h(App)
}).$mount('#app');
