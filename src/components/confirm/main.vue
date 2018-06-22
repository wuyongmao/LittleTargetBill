<template lang='pug'>
.confirm(
	v-if='show'
)
	.content
		span.title {{title}}
		input.input(
			type='digit'
			v-model='price'
			placeholder='0'
		)
		.marks
			button.mark(
				v-for='(mark, index) of marks' :key='index'
				:class='index === currentMarkIndex && "selected"'
				@click='currentMarkIndex = index'
			) {{mark}}
		button.click(
			@click='clickConfirm'
		) 确定
		.close(
			@click='$emit("close")'
		)
			img.close-img(
				:src="closeImg"
			)
</template>

<script>
import main from './main.coffee'

export default {
	...main
}
</script>

<style lang='sass'>
@import '~@/sass/components/confirm'
</style>
