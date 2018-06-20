export default
	data: ->
		motto: 'Hello World'
		userInfo: {}

	methods:
		goIndex: ->
			wx.navigateTo
				url: '../logs/main'
		bindViewTap: ->
			url = '../logs/main'
			wx.navigateTo { url }

		getUserInfo: ->
			# 调用登录接口
			wx.login(
				success: =>
					wx.getUserInfo(
						success: (res) =>
							console.log res
							this.userInfo = res.userInfo
					)
			)

		clickHandle: (msg, ev) ->
			console.log 'clickHandle:', msg, ev

	created: ->
		# 调用应用实例的方法获取全局数据
		this.getUserInfo()