export default
	data: ->
		target: '去日本'
		lastDays: 100
		spendShow: false
		incomeShow: false

	methods:
		goIndex: ->
			wx.navigateTo
				url: '../logs/main'

		clickConfirm: (type, payload) ->
			console.log type
			console.log payload

	mounted: ->
		# 如果是首次或相应场景值进来则前往欢迎页
		# wx.redirectTo {url: '../welcome/main'}