// Using a module system 
import Vue from 'vue';
import VueRouter from 'vue-router';

// route components.
import Home from '../components/Home.vue';

Vue.use(VueRouter);

const routes = [
    { path: '/', component: Home },
    { path: '/ChowNow', component: ChowNow },
    { path : '/DoorDash', component: DoorDash }
]

// Create the router instance
const router = new VueRouter({
    routes // short for `routes: routes`
})

// Export to app
export { router };