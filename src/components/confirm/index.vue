<template lang='pug'>
.confirm.model
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
@import '~@/sass/components/model'

.input
  @extend .inputBorder
  width: 440rpx
  height: 100rpx
  border: 4rpx solid #FED6A4
  border-radius: 10px
  margin-top: 32rpx

.marks
  display: flex
  flex-wrap: wrap
  justify-content: space-between
  width: 400rpx
  margin-top: 40rpx

  .mark
    display: inline-block
    width: 160rpx
    line-height: 64rpx
    border: 2rpx solid #FED6A4
    border-radius: 32rpx
    margin: 20rpx 0
    text-align: center
    background: transparent

  .selected
    background-image: linear-gradient(-180deg, #FEF3AA 0%, #FFE888 100%)
    color: $mainTextColor

.click
  @extend .buttonHightlight
  width: 420rpx
  height: 90rpx
  margin-top: 0
</style>
