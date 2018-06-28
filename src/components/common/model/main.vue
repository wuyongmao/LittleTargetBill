<template lang='pug'>
.confirm(
  v-if='show'
)
  .content
    span.title {{title}}
    slot
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
