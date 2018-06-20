export default
	data: ->
		motto: 'Hello World'
		userInfo: {}

	methods:
		goIndex: ->
			wx.navigateBack()