<template lang='pug'>
.container
	from
		input.wanted(
			placeholder='你的愿望'
			:value='wanted'
		)
		input.total(
			type='number'
			placeholder='愿望金额'
			:value='total'
		)
		input.income(
			type='number'
			placeholder='当前实际月收入'
			:value='income'
		)
	button(
		@click='goIndex'
	) go
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
.wanted
	margin-top: 40rpx
.total
	margin-top: 20rpx
.income
	margin-top: 80rpx
</style>
