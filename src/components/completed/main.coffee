export default
	props:
		totalDays: Number

	methods:
		clickCheck: ->
			console.log 'check'

		clickAgain: ->
			wx.removeStorage
				key: 'main'
				success: =>
					wx.redirectTo
						url: '/pages/regist/main'