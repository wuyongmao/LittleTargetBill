export default
	data: ->
		main: wx.getStorageSync 'main'
		spendShow: false
		incomeShow: false

	computed:
		# 还差多少钱
		totalAway: -> this.main.budget + this.totalSpend - this.totalIncome - (this.dayIncome * this.totalDays)
		# 共记账多少天
		totalDays: -> (new Date().getTime()) // 1000 // (24 * 3600) - this.main.initialTimestampDay + 1
		# 共消费
		totalSpend: -> this.main.listSpend.reduce ((pre, cur) -> pre + cur.price), 0
		# 共收入
		totalIncome: -> this.main.listIncome.reduce ((pre, cur) -> pre + cur.price), 0
		# 每日收入
		dayIncome: -> this.main.income // 30
		# 还差多少天
		lastDays: -> this.totalAway // this.dayIncome

	mounted: ->
		if not this.main
			# 如果是首次或目标无效
			wx.redirectTo
				url: '../welcome/main'
		else


	methods:
		goIndex: ->
			wx.navigateTo
				url: '../logs/main'

		clickConfirm: (type, payload) ->
			switch type
				when 0 then this.main.listSpend.push payload
				when 1 then this.main.listIncome.push payload
			wx.setStorage
				key: 'main'
				data:
					this.main
				success: =>
					console.log this.main
				fail: (error) ->
					wx.showToast
						title: error
						icon: 'none'
						duration: 2000
