<template lang='pug'>
	.card
		span.title {{title}}
		input.input(
			:type='type'
			:placeholder='placeholder'
		)
		span.remind {{remind}}
</template>

<script>
import card from './card.coffee'

export default {
	...card
}
</script>

<style scoped lang='sass'>
.card
	display: flex
	flex-direction: column
	align-items: center

	.title
		color: #983F24
		font-size: 36rpx

	.input
		width: 550rpx
		height: 90rpx
		border: 4rpx solid #FED6A4
		border-radius: 16rpx
		border-box: box-sizing
		padding-left: 40rpx
		margin: 10rpx 0

	.remind
		display: inline-block
		width: 100%
		font-size: 20rpx
		text-align: right
		color: #999
</style>
