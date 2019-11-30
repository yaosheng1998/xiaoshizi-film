import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import cookie from '@/assets/tools/cookie'
import axioser from '@/assets/tools/axioser'

Vue.use(Vuex)

export default new Vuex.Store({
  strict: true,
  state: {
    username: null,
    isShowFilm: false,
    isShowFilmSrc: null,
    isLoaded: false,
    historyList: []
  },
  mutations: {
    setLoadState (state, status) {
      state.isLoaded = status
    },
    setShowState (state, payload) {
      state.isShowFilm = payload.status
      state.isShowFilmSrc = payload.src
    },
    setUsername (state, payload) {
      state.username = payload
    },
    setHistoryList (state, payload) {
      payload = payload.sort((a, b) => {
        return parseInt(b.time) - parseInt(a.time)
      })
      let length = state.historyList.length
      for (let i = 0; i < length; i++) {
        state.historyList.shift()
      }
      length = payload.length
      for (let i = 0; i < length; i++) {
        state.historyList.push(payload[i])
      }
    },
    delHistory (state) {
      let length = state.historyList.length
      for (let i = 0; i < length; i++) {
        state.historyList.shift()
      }
    }
  },
  actions: {
    getHistory ({ state, commit }) {
      axios.get('http://47.102.117.99/FilmDB/doGetHistory.jsp', {
        params: {
          username: state.username
        }
      }).then((data) => {
        // console.log(data)
        commit('setHistoryList', data.data)
      })
    },
    // filmSrc, filmName
    onVideoClick ({ state, commit, dispatch }, payload) {
      // console.log(state.username)
      if (cookie.getCookie('login') !== 'true') {
        window.alert('请先登录!')
        return
      }
      commit('setShowState', { status: true, src: payload.filmSrc })
      axios.get('http://47.102.117.99/FilmDB/doAddHistory.jsp', {
        params: {
          username: state.username,
          filmName: payload.filmName,
          time: String(+new Date())
        }
      }).then((data) => {
        dispatch('getHistory')
        // console.log(data)
      })
    },
    /**
     * @Description: 检查是否登录
     * @author yaosh
     * @date 2019/11/26
     */
    checkLoaded ({ commit, dispatch }) {
      if (cookie.getCookie('login') === 'true') {
        axioser.sendMessage('http://47.102.117.99/FilmDB/doLogin.jsp', {
          username: cookie.getCookie('username'),
          password: cookie.getCookie('password')
        }, (res) => {
          // console.log(res)
          if (res.data.status === 'success') {
            commit('setLoadState', true)
            commit('setUsername', cookie.getCookie('username'))
            dispatch('getHistory')
            // this.setLoadState(true)
            // this.setUsername(cookie.getCookie('username'))
            // // console.log(this.username)
            // this.getHistory()
          }
        })
      }
    }
  },
  modules: {}
})
