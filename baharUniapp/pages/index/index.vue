<template>
  <view class="container">
      <!-- 装饰头已移除：它叠在吸顶区之上占掉首屏 175px（约 26%），竞品没有这块。
           样式类 .bahar-gradient-header 保留在 App.vue，其它页面照用。 -->
      <empty v-if="!storeInfo" :isLoading="isLoading" tips="数据加载中..."></empty>
      <!-- 门店信息 + 搜索框作为一个整体吸顶固定（餐饮原首页没有这两块，按竞品结构补上） -->
      <view class="index-sticky-header" v-if="storeInfo">
        <Location inline :storeInfo="storeInfo" :tableInfo="tableInfo"/>
        <Search inline tips="请输入搜索关键字..." @event="$navTo('pages/search/index')"/>
      </view>
      <block>
          <HomeBanner v-if="storeInfo" :banners="banner"/>
      </block>
      <block>
          <HomeUser v-if="storeInfo" :userInfo="userInfo"/>
      </block>
      <block>
          <view class="scan-entry" v-if="storeInfo" @click="onScanCode">
              <view class="scan-icon">
                  <text class="iconfont icon-qr-extract"></text>
              </view>
              <view class="scan-text">
                  <view class="scan-title">扫码点餐</view>
                  <view class="scan-desc">扫描桌码二维码，快速点餐</view>
              </view>
              <view class="scan-arrow">
                  <text class="iconfont icon-xiangyoujiantou"></text>
              </view>
          </view>
      </block>
      <block>
          <HomeService v-if="storeInfo" :data="[]"/>
      </block>
      <block>
          <HomeNav v-if="storeInfo && navigation.length > 0" :navigation="navigation"/>
      </block>
      <block v-if="storeInfo && coupons.length">
          <view class="bahar-card index-coupon-card">
            <view class="index-section-title"><text class="txt">优惠专区</text></view>
            <Coupon :itemStyle="options.couponStyle" :dataList="coupons"/>
          </view>
      </block>
      <block>
          <HomeAds v-if="storeInfo" :ads="ads"/>
      </block>
  </view>
</template>

<script>
  import { setCartTabBadge, showMessage } from '@/utils/app'
  import Location from '@/components/page/location'
  import Search from '@/components/search'
  import Coupon from '@/components/page/coupon'
  import Empty from '@/components/empty'
  import HomeBanner from "./components/HomeBanner.vue"
  import HomeService from "./components/HomeService.vue"
  import HomeUser from "./components/HomeUser.vue"
  import HomeNav from "./components/HomeNav.vue"
  import HomeAds from "./components/HomeAds.vue"
  import * as settingApi from '@/api/setting'
  import * as Api from '@/api/page'
  import * as UserApi from '@/api/user'
  import * as couponApi from '@/api/coupon'
  import MescrollCompMixin from "@/components/mescroll-uni/mixins/mescroll-comp.js";
  import config from '@/config'

  const App = getApp()

  export default {
    mixins: [MescrollCompMixin],
    components: {
       Location,
       Search,
       Coupon,
       Empty,
       HomeBanner,
       HomeService,
       HomeUser,
       HomeNav,
       HomeAds
    },
    data() {
      return {
        options: {
            "couponStyle": {
                "background": "transparent",
                "display": "list",
                "column": 1
            }
        },
        banner: [],
        ads: [],
        coupons: [],
        storeInfo: null,
        // 餐饮行业化：扫码点餐后桌码要一直顶在门店条上
        tableInfo: null,
        userInfo: {},
        isReflash: false,
        isLoading: false,
        navigation: [],
        wxSdkReady: false
      }
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad({ storeId }) {
      storeId = storeId ? parseInt(storeId) : 0;
      if (storeId > 0) {
          uni.setStorageSync('storeId', storeId);
          uni.setStorageSync("reflashHomeData", true);
      } else {
          this.getPageData();
      }
      // #ifdef H5
      this.preloadWxSdk();
      // #endif
    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow() {
      const app = this;
      showMessage();
      setCartTabBadge();
      app.onSyncTableInfo();
      app.onGetStoreInfo();
      app.getUserInfo();
      uni.getLocation({
          type: 'gcj02',
          success(res){
              uni.setStorageSync('latitude', res.latitude);
              uni.setStorageSync('longitude', res.longitude);
              app.onGetStoreInfo();
          },
          fail(e) {
             // empty
          }
      })
    },

    methods: {

        /**
         * 加载页面数据
         * @param {Object} callback
         */
        getPageData(callback) {
          const app = this;
          Api.home()
            .then(result => {
                 app.banner = result.data.banner;
                 app.ads = result.data.ads;
                 app.navigation = result.data.navigation;
                 uni.removeStorageSync("reflashHomeData");
                 app.isReflash = false;
            })
            .finally(() => callback && callback())
        },

        /**
         * 获取用户信息
         * */
        getUserInfo() {
          const app = this;
          UserApi.info()
            .then(result => {
              app.userInfo = result.data.userInfo ? result.data.userInfo : {};
            })
        },

        /**
         * 加载首页优惠券（领券中心前几条，拿不到就整块不显示）
         */
        getCouponList() {
          const app = this;
          const param = { sortType: 'all', sortPrice: 0, type: 'C', needPoint: '0', name: '', pageNumber: 1 }
          couponApi.list(param, { isPrompt: false, load: false })
            .then(result => {
                 const page = (result.data && result.data.coupon) ? result.data.coupon : {}
                 app.coupons = page.content || []
            })
            .catch(() => {
                 app.coupons = []
            })
        },

        /**
         * 同步桌码到门店条（扫码点餐后 tableId 会写进 storage）
         */
        onSyncTableInfo() {
          const app = this;
          const tableId = uni.getStorageSync('tableId');
          app.tableInfo = tableId && parseInt(tableId) > 0 ? { code: parseInt(tableId) } : null;
        },

        /**
         * 下拉刷新
         */
        onPullDownRefresh() {
          // 获取数据
          this.getUserInfo();
          this.getPageData(() => {
             uni.stopPullDownRefresh()
          })
        },

        /**
         * 扫码点餐
         */
        onScanCode() {
            const app = this;
            // #ifdef MP-WEIXIN
            uni.scanCode({
                scanType: ['qrCode'],
                success(res) {
                    app.handleScanResult(res.result);
                },
                fail(err) {
                    if (err.errMsg !== 'scanCode:fail cancel') {
                        uni.showToast({
                            title: '扫码失败，请重试',
                            icon: 'none'
                        });
                    }
                }
            });
            // #endif
            // #ifdef H5
            const ua = navigator.userAgent.toLowerCase();
            if (ua.indexOf('micromessenger') === -1) {
                uni.showToast({ title: '请在微信中扫码', icon: 'none' });
                return;
            }
            app.loadWxJsSdk(() => {
                const url = window.location.href.split('#')[0];
                // #ifdef H5
                console.log('[扫码点餐] 请求JSSDK配置, url:', url);
                // #endif
                settingApi.jsSdkConfig(url).then(function(result) {
                    // #ifdef H5
                    console.log('[扫码点餐] JSSDK配置:', result);
                    // #endif
                    var config = result.data;
                    if (!config || !config.appId) {
                        uni.showToast({ title: '公众号AppID未配置', icon: 'none', duration: 3000 });
                        return;
                    }
                    if (!window.wx || typeof window.wx.config !== 'function') {
                        uni.showToast({ title: '微信SDK未就绪', icon: 'none', duration: 3000 });
                        return;
                    }
                    window.wx.config({
                        debug: false,
                        appId: config.appId,
                        timestamp: config.timestamp,
                        nonceStr: config.nonceStr,
                        signature: config.signature,
                        jsApiList: ['scanQRCode']
                    });
                    window.wx.ready(function() {
                        window.wx.scanQRCode({
                            needResult: 1,
                            scanType: ['qrCode'],
                            success: function(res) {
                                app.handleScanResult(res.resultStr);
                            },
                            fail: function() {
                                uni.showToast({ title: '扫码失败，请重试', icon: 'none' });
                            }
                        });
                    });
                    window.wx.error(function(err) {
                        console.log('[扫码点餐] wx.error:', err);
                        uni.showToast({ title: '微信配置失败，请重试', icon: 'none' });
                    });
                }).catch(function(err) {
                    console.log('[扫码点餐] 请求失败:', err);
                    uni.showToast({ title: '获取配置失败', icon: 'none', duration: 2500 });
                });
            });
            // #endif
        },

        /**
         * 处理扫码结果（提取tableId）
         */
        handleScanResult(result) {
            const app = this;
            let tableId = 0;
            if (/^\d+$/.test(result)) {
                tableId = parseInt(result);
            } else {
                const match = result.match(/[?&]tableId=(\d+)/);
                if (match) {
                    tableId = parseInt(match[1]);
                }
            }
            if (tableId > 0) {
                uni.setStorageSync('tableId', tableId);
                app.tableInfo = { code: tableId };
                app.$navTo('pages/category/index', { tableId: tableId });
            } else {
                uni.showToast({
                    title: '无效的桌码二维码',
                    icon: 'none'
                });
            }
        },

        /**
         * 页面加载时预加载微信JSSDK
         */
        preloadWxSdk() {
            var app = this;
            var script = document.createElement('script');
            script.src = 'https://res.wx.qq.com/open/js/jweixin-1.6.0.js';
            script.onload = function() {
                var retry = 0;
                var timer = setInterval(function() {
                    if (window.wx && typeof window.wx.config === 'function') {
                        clearInterval(timer);
                        app.wxSdkReady = true;
                    } else if (++retry >= 30) {
                        clearInterval(timer);
                    }
                }, 200);
            };
            script.onerror = function() {};
            document.head.appendChild(script);
        },

        /**
         * 确保微信JSSDK已就绪
         */
        loadWxJsSdk(callback) {
            var app = this;
            if (app.wxSdkReady && window.wx && typeof window.wx.config === 'function') {
                callback();
                return;
            }
            // SDK尚未就绪，轮询等待（最多3秒）
            var retry = 0;
            var timer = setInterval(function() {
                if (window.wx && typeof window.wx.config === 'function') {
                    clearInterval(timer);
                    app.wxSdkReady = true;
                    callback();
                } else if (++retry >= 15) {
                    clearInterval(timer);
                    uni.showToast({
                        title: '请刷新页面后重试',
                        icon: 'none',
                        duration: 3000
                    });
                }
            }, 200);
        },

        /**
         * 获取默认店铺
         * */
         onGetStoreInfo() {
            const app = this;
            settingApi.systemConfig()
             .then(result => {
                 app.storeInfo = result.data.storeInfo;
                 if (app.storeInfo) {
                     uni.setStorageSync("storeId", app.storeInfo.id);
                     uni.setStorageSync("merchantNo", app.storeInfo.merchantNo);
                     // 判断是否需要更新页面
                     let isReflash = uni.getStorageSync("reflashHomeData");
                     app.isReflash = isReflash;
                     if (isReflash === true) {
                         app.getPageData();
                     }
                 }
                 app.getCouponList();
             })
         }
    },

    /**
     * 分享当前页面
     */
    onShareAppMessage() {
      const app = this
      return {
         title: config.name,
         path: "/pages/index/index?" + app.$getShareUrlParams()
      }
    },

    /**
     * 分享到朋友圈
     * 本接口为 Beta 版本，暂只在 Android 平台支持，详见分享到朋友圈 (Beta)
     * https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/share-timeline.html
     */
    onShareTimeline() {
      const app = this
      const { page } = app
      return {
        title: config.name,
        path: "/pages/index/index?" + app.$getShareUrlParams()
      }
    }

  }
</script>
<style lang="scss" scoped>
    /* 门店信息 + 搜索框整体吸顶。
       子组件内部默认 fixed（不占文档流，且未设 top 时按静态位置锚定，
       前置内容高度一变就跑位），所以首页把两者都切到 inline 模式，由本容器统一吸顶。
       top 用 --window-top 兼容 H5 自带的导航栏高度，小程序端该变量不存在时回退 0。 */
    .index-sticky-header {
      position: sticky;
      top: var(--window-top, 0);
      z-index: 100;
      /* 沿用品牌主色（与门店条同一渐变），避免吸顶后露出大白块 */
      background-image: linear-gradient(to bottom, $bahar-theme, $bahar-theme);
    }

    .index-section-title {
      font-size: 30rpx;
      font-weight: bold;
      padding: 20rpx 20rpx 12rpx;
      .txt {
        border-left: solid $bahar-theme 10rpx;
        padding-left: 10rpx;
      }
    }

    /* 优惠券区做成与四宫格/商品区一致的卡片 */
    .index-coupon-card {
      padding: 0 0 12rpx 0;
    }

    .scan-entry {
        display: flex;
        align-items: center;
        /* 与首页其它卡片同一条边：原来是 10rpx，比 .bahar-card 的 24rpx 窄一截 */
        margin: 24rpx;
        padding: 30rpx;
        /* 统一强调色：原来是「主色 → 橙 #ff9f7d」的渐变 + 橙色投影，
           会在首页多出一套橙。改为主色深浅渐变，橙色只保留给促销文字用。 */
        background: linear-gradient(135deg, $bahar-theme, #00c9c9);
        border-radius: 16rpx;
        box-shadow: 0 4rpx 16rpx rgba(0, 172, 172, 0.25);

        .scan-icon {
            width: 80rpx;
            height: 80rpx;
            background: rgba(255, 255, 255, 0.25);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 24rpx;
            flex-shrink: 0;

            .iconfont {
                font-size: 44rpx;
                color: #fff;
            }
        }

        .scan-text {
            flex: 1;

            .scan-title {
                font-size: 32rpx;
                font-weight: bold;
                color: #fff;
            }

            .scan-desc {
                font-size: 24rpx;
                color: rgba(255, 255, 255, 0.8);
                margin-top: 4rpx;
            }
        }

        .scan-arrow {
            flex-shrink: 0;
            margin-left: 16rpx;

            .iconfont {
                font-size: 32rpx;
                color: rgba(255, 255, 255, 0.6);
            }
        }
    }
</style>
