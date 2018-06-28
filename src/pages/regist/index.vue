<template lang='pug'>
.container
  img.title-img(
    :src='titleImg'
  )
  inputDream(
    title='输入你的小目标'
    placeholder='请输入小目标'
    remind='注：如“去日本”'
    @input='inputCard(0, $event)'
  )
  inputDream(
    title='小目标的预算'
    placeholder='请输入预算'
    remind='注：如“5000”'
    type='number'
    @input='inputCard(1, $event)'
  )
  inputDream(
    title='月实际收入'
    placeholder='请输入月收入'
    type='number'
    @input='inputCard(2, $event)'
  )
  button.click(
    @click='goIndex'
  ) 开始实现小目标
</template>

<script>
import main from './main.coffee'
import inputDream from '@/components/inputDream/main'

export default {
  components: {
    inputDream
  },
  ...main,
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
    @extend .buttonHightlight
</style>
