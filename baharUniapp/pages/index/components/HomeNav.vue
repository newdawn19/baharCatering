<template>
    <view class="navigation bahar-card bahar-anim">
        <view class="nav">
            <view class="item bahar-press" v-for="(item, index) in navigation" :key="index">
                <image class="icon" mode="aspectFit" :src="item.iconUrl" @click.stop="goUrl(item.url)"></image>
                <view class="title">{{ item.name }}</view>
            </view>
        </view>
    </view>
</template>

<script>
export default {
    props: {
        navigation: {
            type: Array,
            default: []
        }
    },
    methods: {
        goUrl(url) {
            this.$navTo(url);
        }
    }
}
</script>

<style lang="scss" scoped>
.nav {
    position: relative;
    /* 外边距由 .bahar-card 统一给 24rpx，这里不能再叠一层 10rpx，
       否则四宫格会比下方优惠券卡/广告卡窄 14rpx。 */
    margin: 0;
    padding: 24rpx 0;
    border-radius: 10rpx;
    background-color: #ffffff;
    border: none;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: center;

    .item {
        /* 一行放不下时自动换行，不再把图标挤成一条 */
        flex: 0 0 25%;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        position: relative;

        .icon {
            width: 56rpx;
            height: 56rpx;
            margin: 16rpx auto 8rpx;
            padding: 16rpx;
            box-sizing: content-box;
            border-radius: 28rpx;
            border: none;
            background: rgba($bahar-theme, 0.08);
        }

        .title {
            font-size: 24rpx;
            color: #333;
            font-weight: 600;
            padding: 0 4rpx;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .content {
            font-size: 20rpx;
            color: #666;
            font-weight: 400;
        }
    }
}

</style>
