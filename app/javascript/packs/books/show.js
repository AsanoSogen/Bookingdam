import Vue from "vue/dist/vue.esm"
import VueRouter from 'vue-router'  
import axios from 'axios';
import ElementUI from 'element-ui'
import locale from 'element-ui/lib/locale/lang/ja'
import 'element-ui/lib/theme-chalk/index.css'
Vue.use(ElementUI, { locale });
Vue.use(VueRouter);


const router =  new VueRouter({
  mode: 'history',
  routes: [
    {
      path: "/books/:id",
      component: require('../books/show.js')
    },
  ],
})

var Main3 ={
  router,
  data: function() {
    return {
      users: []
    }
  },
  created() {
    axios.get(`/api/v1/books/${this.$route.params.id}`)
      .then(res => {
        this.users = res.data
      })
  }
};
var Show = Vue.extend(Main3);
new Show().$mount('#app3');