<template>
  <div class="load-view">
    <div class="mark"/>
    <div class="load-wrap">
      <div class="mode">
        <p class="iconfont" :class="{active: isLoading}"
           @click="changeLoading"
        >Sign in</p>
        <p class="iconfont" :class="{active: !isLoading}"
           @click="changeRegister"
        >Sign up</p>
      </div>
      <div class="load-content">
        <div>
          <i class="iconfont">&#xe612;</i>
          <input type="text" placeholder="Username" v-model="username"
                 @keyup.enter="inputEnter"
          >
          <p/>
        </div>
        <div>
          <i class="iconfont">&#xe664;</i>
          <input type="password" placeholder="Password" v-model="password"
                 @keyup.enter="inputEnter"
          >
          <p/>
        </div>
        <div v-mshow="!isLoading">
          <i class="iconfont">&#xe664;</i>
          <input type="password" placeholder="Repeat" v-model="repeat"
                 @keyup.enter="inputEnter"
          >
          <p/>
        </div>
      </div>
      <button class="load-btn" v-if="isLoading" @click="onLoadingClick">LOGIN</button>
      <button class="register-btn" v-else @click="onRegisterClick">REGISTER
      </button>
      <button class="back-btn" @click="onBackClick">BACK</button>
    </div>
  </div>
</template>

<script>
  import cookie from '@/assets/tools/cookie'
  import axioser from '@/assets/tools/axioser'
  import { mapState, mapMutations, mapActions } from 'vuex'
  export default {
    data () {
      return {
        isLoading: true,
        username: '',
        password: '',
        repeat: ''
      }
    },
    computed: {
      ...mapState(['isLoaded'])
    },
    methods: {
      ...mapMutations(['setLoadState', 'setUsername']),
      ...mapActions(['getHistory']),
      changeLoading () {
        this.isLoading || this.clearText()
        this.isLoading = true
      },
      changeRegister () {
        this.isLoading && this.clearText()
        this.isLoading = false
      },
      clearText () {
        this.username = ''
        this.password = ''
        this.repeat = ''
      },
      /**
       * @Description: 点击登录
       * @author yaosh
       * @date 2019/11/26
      */
      onLoadingClick () {
        axioser.sendMessage('http://47.102.117.99/FilmDB/doLogin.jsp', {
          username: this.username,
          password: this.password
        }, (res) => {
          this.$message({
            type: res.data.status === 'success' ? 'success' : 'error',
            message: res.data.msg
          })
          if (res.data.status !== 'success') return
          cookie.setCookie('login', 'true', 365)
          cookie.setCookie('username', this.username, 365)
          cookie.setCookie('password', this.password, 365)
          this.setLoadState(true)
          this.setUsername(this.username)
          this.getHistory()
          // console.log(res)
          setTimeout(() => {
            this.onBackClick()
          }, 500)
        })
      },
      /**
       * @Description: 点击注册
       * @author yaosh
       * @date 2019/11/26
      */
      onRegisterClick () {
        axioser.sendMessage('http://47.102.117.99/FilmDB/doRegister.jsp', {
          username: this.username,
          password: this.password,
          repeat: this.repeat,
          avatarID: 1
        }, (res) => {
          this.$message({
            type: res.data.status === 'success' ? 'success' : 'error',
            message: res.data.msg
          })
          // console.log(res)
        })
      },
      onBackClick () {
        this.$parent.isLoading = false
      },
      inputEnter () {
        this.isLoading ? this.onLoadingClick() : this.onRegisterClick()
      }
    },
    directives: {
      mshow: {
        bind (el, bindings, vnode) {
          bindings.value || (el.style.opacity = '0')
        },
        update (el, bindings, vnode) {
          if (bindings.value) {
            el.style.opacity = '1'
          } else {
            el.style.opacity = '0'
            vnode.context.$data.repeat = ''
          }
        }
      }
    }
  }
</script>

<style lang="less">
  @import '~@/assets/styles/header/load.less';
</style>
