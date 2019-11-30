<template>
  <div class="header">
    <div class="logo">
      <router-link to="/">
        <img src="@/assets/img/header/logo.png" alt="logo">
      </router-link>
    </div>
    <search-bar/>
    <nav-bar/>
  </div>
</template>

<script>
  import SearchBar from './SearchBar'
  import NavBar from './NavBar'
  export default {
    components: {
      SearchBar,
      NavBar
    }
  }
</script>

<style lang="less">
  @import '~@/assets/styles/header/index';
</style>
