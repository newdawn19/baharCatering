<template>
    <view class="ads">
        <swiper class="bg" circular :indicator-dots="false" :autoplay="true" :interval="5000" :duration="200">
            <swiper-item v-for="(item, index) in ads" :key="index">
                <view class="ad-item">
                    <image class="image" mode="aspectFill" :src="item.image" @click.stop="goUrl(item.url)"></image>
                </view>
            </swiper-item>
        </swiper>
    </view>
</template>

<script>
    export default {
        props: {
            ads: {
                type: Array,
                // Object/Array 的 default 必须是工厂函数，否则所有实例共享同一个数组引用，
                // Vue 会报 "Invalid default value for prop"。原来写的是 default: []
                default: () => []
            }
        },
        methods: {
            goUrl(url) {
                this.$navTo(url);
            }
        },
    }
</script>

<style lang="scss" scoped>
.ads {
    /* 与其它首页卡片同一条边（.bahar-card 的 24rpx）。
       原来 width:100% + padding 0 10rpx，容器边缘落在 0~375，比卡片外扩一截。
       width 必须改成 auto：100% 再叠 margin 会横向溢出。 */
    width: auto;
    box-sizing: border-box;
    margin: 0 24rpx 24rpx;
    padding: 0;
    display: block;
    background: #fff;
    border-radius: 16rpx;
    overflow: hidden;
}
.bg {
    width: 100%;
    /* 广告图是 800×420，按卡片宽度换算约 360rpx 高。
       原来 .bg/.swiper 上挂了 margin-bottom:550rpx（明显写漏了），
       一旦 ads 有数据，广告图下面会凭空多出一大片空白，这里一并去掉。 */
    height: 360rpx;
}
.ad-item {
    width: 100%;
    height: 360rpx;
    image {
        width: 100%;
        height: 100%;
        border-radius: 16rpx;
    }
}
</style>
