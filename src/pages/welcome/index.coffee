import titleImg from '@/assets/title.png'

export default
	data: ->
		motto: 'Hello World'
		userInfo: {}
		titleImg: titleImg

	methods:
		goIndex: ->
			wx.navigateBack()