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
import main from './main.coffee'

export default {
	...main
}
</script>

<style scoped lang='sass'>
@import '~@/sass/main.sass'

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
		@include inputBorder
		margin: 10rpx 0

	.remind
		display: inline-block
		width: 100%
		font-size: 20rpx
		text-align: right
		color: #999
</style>
