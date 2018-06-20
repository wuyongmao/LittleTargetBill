export default
	data: ->
		motto: 'Hello World'
		userInfo: {}

	methods:
		goIndex: ->
			wx.navigateTo
				url: '../logs/main'

	mounted: ->
		# 如果是首次或相应场景值进来则前往欢迎页
		wx.navigateTo {url: '../welcome/main'}