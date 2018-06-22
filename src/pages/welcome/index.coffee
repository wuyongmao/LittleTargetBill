import titleImg from '@/assets/title.png'

export default
	data: ->
		target: ''
		budget: ''
		income: 0
		titleImg: titleImg

	methods:
		goIndex: ->
			return if this.dataError()

			wx.setStorage
				key: 'main'
				data:
					target: this.target
					budget: this.budget
					income: this.income
					listSpend: []
					listIncome: []
					initialTimestampDay: (new Date()).getTime() // 1000 // (24 * 3600) # 起始的时间戳天
				success: ->
					wx.redirectTo
						url: '../welcome/main'
				fail: (error) ->
					wx.showToast
						title: error
						icon: 'none'
						duration: 2000

		dataError: ->
			if not this.target
				error = '请输入目标'
			else if not this.budget
				error = '请输入预算'
			else if not this.income
				error = '请输入月收入'

			wx.showToast
				title: error ? '请前往你的愿望吧'
				icon: 'none'
				duration: 2000
			error

		inputCard: (type, e) ->
			value = e.target.value
			switch type
				when 0 then this.target = value
				when 1 then this.budget = parseInt(value)
				when 2 then this.income = parseInt(value)
