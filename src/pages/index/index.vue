<template lang='pug'>
.container
	.total
		span.target 离
			span.underline {{target}}
			| 还差
			span.underline {{lastDays}}
			| 天
		.spend
			span 本月消费
			span.normal 100
			span 元
		.markDays
			span 本月连续记账
			span.normal 100
			span 天
	.mark
		button 远离梦想
		.money
			span 一共消费
			span.normal 100
			span 元

	.mark
		button 靠近梦想
		.money
			span 梦想基金达
			span.normal 100
			span 元
</template>

<script>
import index from './index.coffee'
// import card from '@/components/card'

export default {
	components: {
		// card
	},
	...index,
}
</script>

<style scoped lang='sass'>
@import '~@/sass/main'

@mixin money
	display: flex
	justify-content: space-between
	width: 480rpx
	font-size: 40rpx
	color: #F3944E

	.normal
		color: #756766

.container
	justify-content: flex-start

	.total
		display: flex
		flex-direction: column
		justify-content: space-around
		align-items: center
		width: 100%
		height: 33%
		background: #FEF3AA

		.target
			font-size: 48rpx
			color: #F3944E
			text-align: center

			.underline
				color: #756766
				border-bottom: 6rpx solid #F3944E
				margin-right: 8rpx

		.spend, .markDays
			@include money

	.mark
		margin-top: 120rpx

		button
			@include buttonHightlight

		.money
			@include money
			width: 320rpx
			margin: 20rpx 0 0 160rpx
			font-size: 36rpx
			color: #F3944E
</style>
