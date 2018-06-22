export default
	data: ->
		target: '去日本'
		lastDays: 100

	methods:
		goIndex: ->
			wx.navigateTo
				url: '../logs/main'

	mounted: ->
		# 如果是首次或相应场景值进来则前往欢迎页
		# wx.redirectTo {url: '../welcome/main'}