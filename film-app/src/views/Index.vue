<template>
  <div class="index-page">
    <div class="view-wrapper">
      <my-carousel/>
      <ul class="film-nav">
        <li><a href="#comedy">喜剧</a></li>
        <li><a href="#tragedy">悲剧</a></li>
        <li><a href="#love">爱情</a></li>
        <li><a href="#action">动作</a></li>
        <li><a href="#science">科幻</a></li>
        <li><a href="#terror">恐怖</a></li>
        <li><a href="#youth">青春</a></li>
        <li><a href="#family">家庭</a></li>
        <li><a href="#cartoon">动画</a></li>
        <li><a href="#biography">传记</a></li>
        <li><a href="#suspense">悬疑</a></li>
        <li><a href="#crime">犯罪</a></li>
      </ul>
    </div>
    <div class="film-wrapper">
      <div class="recommend">
        <my-film-series title="电影推荐" filmType="recommend"/>
      </div>
      <div class="comedy">
        <a name="comedy"></a>
        <my-film-series title="高分解压喜剧拯救不开心" filmType="comedy"/>
      </div>
      <div class="tragedy">
        <a name="tragedy"></a>
        <my-film-series title="收了瓜子，拿好你的纸巾" filmType="tragedy"/>
      </div>
      <div class="love">
        <a name="love"></a>
        <my-film-series title="有些爱，从不曾离你远去" filmType="love"/>
      </div>
      <div class="action">
        <a name="action"></a>
        <my-film-series title="每个人心中的功夫梦" filmType="action"/>
      </div>
      <div class="science">
        <a name="science"></a>
        <my-film-series title="硬核科幻燃片一次看过瘾" filmType="science"/>
      </div>
      <div class="terror">
        <a name="terror"></a>
        <my-film-series title="胆小慎入(滑稽" filmType="terror"/>
      </div>
      <div class="youth">
        <a name="youth"></a>
        <my-film-series title="致我们未曾逝去的青春" filmType="youth"/>
      </div>
      <div class="family">
        <a name="family"></a>
        <my-film-series title="有些爱，从未离你而去" filmType="family"/>
      </div>
      <div class="cartoon">
        <a name="cartoon"></a>
        <my-film-series title="超燃动漫大盘点" filmType="cartoon"/>
      </div>
      <div class="biography">
        <a name="biography"></a>
        <my-film-series title="伟人永远与你同在" filmType="biography"/>
      </div>
      <div class="suspense">
        <a name="suspense"></a>
        <my-film-series title="烧脑烧断片，让你怀疑人生" filmType="suspense"/>
      </div>
      <div class="crime">
        <a name="crime"></a>
        <my-film-series title="法网恢恢疏而不漏" filmType="crime"/>
      </div>
    </div>
    <my-film-view/>
  </div>
</template>

<script>
  import MyCarousel from '@/components/index/CarPicture'
  import MyFilmSeries from '@/components/index/FilmSeries'
  import MyFilmView from '@/components/index/FilmView'

  export default {
    data () {
      return {
        filmArray: {}
      }
    },
    components: {
      MyCarousel,
      MyFilmSeries,
      MyFilmView
    }
  }
</script>

<style lang="less">
  @import '~@/assets/styles/index/index';
</style>
