<template>
  <div class="default-page">
    <el-container>
      <el-header height="">
        <my-header/>
      </el-header>
      <el-main>
        <router-view/>
      </el-main>
      <el-footer height="">
        <my-footer/>
      </el-footer>
    </el-container>
  </div>
</template>

<script>
  import MyHeader from '@/components/header/Index'
  import MyFooter from '@/components/Footer'
  export default {
    components: {
      MyHeader,
      MyFooter
    }
  }
</script>

<style>
  .el-header,
  .el-main,
  .el-footer{
    padding: 0 !important;
  }
  .el-main{
    overflow: hidden !important;
  }
</style>
