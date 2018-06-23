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
		button(@click='spendShow = true') 支出--远离小目标
		.money
			span 共消费
			span.normal {{totalSpend}}
			span 元

	.mark
		button(@click='incomeShow = true') 收入--靠近小目标
		.money
			span 小目标基金达
			span.normal {{totalIncome}}
			span 元

	button.cancel(@click='clickCancel') 放弃小目标

	confirmSpend(
		v-if='spendShow'
		title='输入支出金额'
		:type='0'
		@close='spendShow = false'
		@confirm='clickConfirm(0, $event)'
	)

	confirmIncome(
		v-if='incomeShow'
		title='输入收入金额'
		:type='1'
		@close='incomeShow = false'
		@confirm='clickConfirm(1, $event)'
	)

	completed(
		v-if='completedShow'
		:totalDays='totalDays'
		@clickCheck='clickCheck'
	)

	share(
		v-if='shareShow'
		:totalDays="totalDays"
		:main="main"
		@close='shareShow=false'
	)
</template>

<script>
import main from './main.coffee'
import confirmSpend from '@/components/confirm/index'
import confirmIncome from '@/components/confirm/index'
import completed from '@/components/completed/index'
import share from '@/components/share/index'

export default {
	components: {
		confirmSpend,
		confirmIncome,
		completed,
		share,
	},
	...main,
}
</script>

<style scoped lang='sass'>
@import '~@/sass/main'

@mixin money
	display: flex
	justify-content: space-between
	width: 480rpx
	font-size: 40rpx
	color: $mainTextColor

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
		background-image: linear-gradient(-180deg, #FEF3AA 0%, #FFE888 100%)

		.target
			font-size: 48rpx
			color: $mainTextColor
			text-align: center

			.underline
				color: #756766
				border-bottom: 6rpx solid $mainTextColor
				margin: 0 40rpx 0 20rpx

		.spend, .markDays
			@include money

	.mark
		margin-top: 120rpx

		button
			@extend .buttonHightlight

		.money
			@include money
			width: 320rpx
			margin: 20rpx 0 0 160rpx
			font-size: 36rpx
			color: $mainTextColor

	$cancelRB: 20rpx
	.cancel
		position: absolute
		right: $cancelRB
		bottom: $cancelRB
		padding: 0
		line-height: normal
		border-radius: 0
		font-size: 24rpx
		color: red
		background: transparent
</style>
