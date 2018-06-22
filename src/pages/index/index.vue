<template lang='pug'>
.container
	.total
		span.target 离
			span.underline {{main.target}}
			| 还差
			span.underline {{lastDays}}
			| 天
		.spend
			span 还差
			span.normal {{totalAway}}
			span 元
		.markDays
			span 共记账
			span.normal {{totalDays}}
			span 天
	.mark
		button(@click='spendShow = true') 支出--远离梦想
		.money
			span 共消费
			span.normal {{totalSpend}}
			span 元

	.mark
		button(@click='incomeShow = true') 收入--靠近梦想
		.money
			span 梦想基金达
			span.normal {{totalIncome}}
			span 元

	confirmSpend(
		title='输入支出金额'
		:show='spendShow'
		:marks="['饭钱', '交通', '购物', '人情', '其他']"
		@close='spendShow = false'
		@confirm='clickConfirm(0, $event)'
	)
	confirmIncome(
		title='输入收入金额'
		:show='incomeShow'
		:marks="['红包', '出售', '理财', '退款', '其他']"
		@close='incomeShow = false'
		@confirm='clickConfirm(1, $event)'
	)
</template>

<script>
import index from './index.coffee'
import confirmSpend from '@/components/confirm/spend/main'
import confirmIncome from '@/components/confirm/income/main'

export default {
	components: {
		confirmSpend,
		confirmIncome
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
				margin: 0 40rpx 0 20rpx

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
