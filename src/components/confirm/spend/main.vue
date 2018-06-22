<template lang='pug'>
confirm(
	v-on='$listeners'
	v-bind='$attrs'
)
</template>

<script>
import confirm from '../main'

export default {
	components: {
		confirm
	}
}
</script>

<style lang='sass'>

</style>
