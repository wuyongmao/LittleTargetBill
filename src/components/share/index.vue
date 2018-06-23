<template lang='pug'>
.model.share
	canvas.share-canvas(
		canvas-id='shareCanvas'
	)
	button.save(
		@click='clickCheck'
	) 保存分享图
</template>

<script>
import main from './main.coffee'

export default {
	...main
}
</script>

<style lang='sass'>
@import '~@/sass/components/mask'

.share
	flex-direction: column

	.share-canvas
		width: 320px
		height: 512px
		border-radius: 0

	.save
		@extend .buttonHightlight
		width: 420rpx
		height: 90rpx
		background-image: linear-gradient(-180deg, #FECBAA 0%, #F7975D 100%)
		color: white
</style>
