<template lang='pug'>
.completed.model
  .content
    span.title ~梦想实现~
    .congratulation
      span 恭喜！
      span.middle 在记账
        span.total-days {{totalDays}}
        | 天内存到了梦想
      span 基金！
    button.check(
      @click='clickCheck'
    ) 查看成就
    button.again(
      @click='clickAgain'
    ) 再许个愿
</template>

<script>
import main from './main.coffee'

export default {
  ...main
}
</script>

<style scoped lang='sass'>
@import '~@/sass/components/model'

.congratulation
  display: flex
  flex-direction: column
  margin: 60rpx 0 60rpx 0

  span
    color: $mainTextColor

  .middle
    margin-top: 60rpx

    .total-days
      margin: 0 10rpx

.button
  @extend .buttonHightlight
  width: 420rpx
  height: 90rpx

.check
  @extend .button
  background-image: linear-gradient(-180deg, #FECBAA 0%, #F7975D 100%)
  color: white

.again
  @extend .button
</style>
