export default
  props:
    totalDays: Number

  methods:
    clickCheck: ->
      this.$emit('clickCheck')

    clickAgain: ->
      wx.removeStorage
        key: 'main'
        success: =>
          wx.redirectTo
            url: '/pages/regist/main'