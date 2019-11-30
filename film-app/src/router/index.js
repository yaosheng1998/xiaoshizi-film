import Vue from 'vue'
import VueRouter from 'vue-router'
import Default from '@/layout/Default'

Vue.use(VueRouter)

const router = new VueRouter({
  // mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'default',
      component: Default,
      redirect: '/index',
      children: [
        {
          path: 'index',
          name: 'index',
          component: () => import('@/views/Index.vue')
        }
      ]
    },
    {
      path: '*',
      redirect: '/index'
    }
  ]
})

export default router
