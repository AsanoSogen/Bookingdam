import Vue from "vue"
import ToDoIndex from '../../books/show.vue'
import ElementUI from 'element-ui'
import locale from 'element-ui/lib/locale/lang/ja'
import 'element-ui/lib/theme-chalk/index.css'
Vue.use(ElementUI, { locale });


document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(ToDoIndex)
  }).$mount()
  document.body.appendChild(app.$el)
})