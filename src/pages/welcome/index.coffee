import titleImg from '@/assets/title.png'

export default
	mounted: ->
		setTimeout (->
			if wx.getStorageSync 'main'
				wx.redirectTo {url: '/pages/index/main'}
			else
				wx.redirectTo {url: '/pages/regist/main'}), 1000
