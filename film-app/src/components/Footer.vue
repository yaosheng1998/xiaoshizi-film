<template>
  <div class="footer">
    <div class="left iconfont">
      &#xe61d;
      <span>小柿子影院</span>
    </div>
    <div class="middle">
      <ul>
        <li>
          <a href="https://github.com/yaosheng1998/xiaoshizi-film" target="_blank">GitHub</a>
        </li>
        <li>
          <span>邮箱</span>
          <i>|</i>
          <span>关于</span>
        </li>
        <li>@2019xiaoshizi</li>
      </ul>
    </div>
    <div class="right">
      <div class="right-wrapper">
        <img src="@/assets/img/footer/QRfeedBack.png" alt="QR">
        <p>问题反馈</p>
      </div>
    </div>
    <div class="top-btn iconfont" @click="backTop" v-show="btnFlag">
      &#xe614;
    </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        btnFlag: false,
        scrollTop: 0
      }
    },
    mounted () {
      window.addEventListener('scroll', this.scrollToTop)
    },
    destroyed () {
      window.removeEventListener('scroll', this.scrollToTop)
    },
    methods: {
      backTop () {
        let speed = null
        this.timer = setInterval(() => {
          speed = Math.ceil(this.scrollTop / 5)
          document.documentElement.scrollTop = document.body.scrollTop = this.scrollTop - speed
          this.scrollTop === 0 && clearInterval(this.timer)
        }, 10)
      },
      scrollToTop () {
        let scrollTop = window.pageYOffset || document.documentElement.scrollTop ||
            document.body.scrollTop
        this.scrollTop = scrollTop
        this.btnFlag = scrollTop > 60
      }
    }
  }
</script>

<style lang="less">
  @import '~@/assets/styles/footer';
</style>
