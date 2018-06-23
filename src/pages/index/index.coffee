export default
	data: ->
		main: ''
		spendShow: false
		incomeShow: false

	computed:
		# 每日收入
		dayIncome: -> this.main.income // 30
		# 还差多少元
		totalAway: -> this.main.budget + this.totalSpend - this.totalIncome - (this.dayIncome * this.totalDays) || ''
		# 共记账多少天
		totalDays: -> (new Date().getTime()) // 1000 // (24 * 3600) - this.main.initialTimestampDay + 1 || ''
		# 共消费
		totalSpend: -> this.main.listSpend.reduce ((pre, cur) -> pre + cur.price), 0 || 0
		# 共收入
		totalIncome: -> this.main.listIncome.reduce ((pre, cur) -> pre + cur.price), 0 || 0
		# 还差多少天
		lastDays: -> this.totalAway // this.dayIncome || 0

	onShow: ->
		this.main = wx.getStorageSync('main') ||
			listSpend: []
			listIncome: []
		console.log this.main

	onReady: ->
		if not this.main.target
			wx.redirectTo
				url: '/pages/regist/main'

	methods:
		clickConfirm: (type, payload) ->
			switch type
				when 0 then this.main.listSpend.push payload
				when 1 then this.main.listIncome.push payload
			wx.setStorage
				key: 'main'
				data:
					this.main
				success: =>
					wx.showToast
						title: '保存成功'
						icon: 'success'
						duration: 300
				fail: (error) ->
					wx.showToast
						title: error
						icon: 'none'
						duration: 2000

		clickCancel: ->
			wx.showModal
				title: '非常重要'
				content: '放弃后不可恢复！'
				success: (res) ->
					if res.confirm
						wx.removeStorage
							key: 'main'
							success: =>
								wx.redirectTo
									url: '/pages/regist/main'
