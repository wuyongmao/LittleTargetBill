import closeImg from '@/assets/close.png'
import util from '@/utils/index.coffee'

export default
  props:
    type: Number
    show: Boolean

  data: -> {
    closeImg
    marks: []
    title: ''
    price: ''
    currentMarkIndex: 0
  }

  mounted: ->
    if this.type is 0
      this.marks = ['饭钱', '交通', '购物', '人情', '其他']
      this.title = '输入支出金额'
    else
      this.marks = ['红包', '出售', '理财', '退款', '其他']
      this.title = '输入收入金额'

  methods:
    clickConfirm: ->
      this.$emit 'confirm',
        price: util.yuan2yuan parseFloat(this.price)
        mark: this.marks[this.currentMarkIndex]
      this.$emit 'close'