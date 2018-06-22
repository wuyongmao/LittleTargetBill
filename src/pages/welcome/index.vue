<template lang='pug'>
.container
	img.title-img(
		:src='titleImg'
	)
	card(
		title='输入你的愿望'
		placeholder='请输入愿望'
		remind='注：如“去日本”'
	)
	card(
		title='愿望的预算'
		placeholder='请输入预算'
		remind='注：如“5000”'
		type='number'
	)
	card(
		title='月实际收入'
		placeholder='请输入月收入'
		type='number'
	)
	button.click(
		@click='goIndex'
	) 开始实现愿望
</template>

<script>
import index from './index.coffee'
import card from '@/components/card'

export default {
	components: {
		card
	},
	...index,
}
</script>

<style scoped lang='sass'>
@import '~@/sass/main'

.container
	justify-content: space-around
	padding: 100rpx 0

	.title-img
		width: 580rpx
		height: 110rpx

	.click
		@include buttonHightlight
</style>
