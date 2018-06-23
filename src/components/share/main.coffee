import group from '@/assets/group.png'
import qr from '@/assets/qr.jpg'

config =
	canvasName: 'shareCanvas'
	canvasWidth:320
	canvasHeight:512
	exportImgPath: ''

export default
	props:
		main: Object
		totalDays: Number

	mounted: ->
		this.draw()

	methods:
		draw: ->
			ctx = wx.createCanvasContext config.canvasName
			# 绘制背景色
			ctx.setFillStyle('white')
			ctx.fillRect(0, 0, config.canvasWidth, config.canvasHeight)

			# 绘制图片
			left = 20
			imgWidth = config.canvasWidth - 2 * left
			console.log left, imgWidth, config.canvasWidth
			ctx.drawImage(group, left, left, imgWidth, imgWidth)

			qrWidth = 88
			qrLeft = config.canvasWidth - left - qrWidth
			ctx.drawImage(qr,  qrLeft, 340, qrWidth, qrWidth)

			# 绘制文本
			fontSize = 20
			initialTop = 340
			marginTop = 8

			date = new Date()
			ctx.setFontSize(fontSize)
			ctx.setFillStyle('#F3944E')
			ctx.fillText(date.getFullYear() + '年' + (date.getMonth() + 1) + '月' + date.getDate() + '日', 16, initialTop)
			ctx.fillText('用愿望账单记账的第', 16, initialTop + (marginTop + fontSize) * 1)
			ctx.fillText(this.totalDays + '天', 16, initialTop + (marginTop + fontSize) * 2)
			ctx.fillText('成功存下了' + this.main.budget + '元', 16, initialTop + (marginTop + fontSize) * 3)
			ctx.fillText(this.main.target + '的梦想基金', 16, initialTop + (marginTop + fontSize) * 4)
			ctx.setFontSize(12)
			ctx.setFillStyle('#999')
			ctx.fillText('长按识别小程序', 218, initialTop + (marginTop + fontSize) * 4)
			# 直接绘制第二次无效
			ctx.draw(false, this.trans)

		# 转成图片
		trans: ->
			width = config.canvasWidth
			height = config.canvasHeight
			wx.canvasToTempFilePath
				x: 0
				y: 0
				width: width
				height: height
				destWidth: width
				destHeight:height
				canvasId: config.canvasName
				success: (res) ->
					config.exportImgPath = res.tempFilePath
				fail: (res) ->
					console.log res

		clickCheck: ->
			wx.saveImageToPhotosAlbum
				filePath:config.exportImgPath
				success: (res) =>
						wx.showModal
							title: '存图成功'
							content: '图片成功保存到相册了，去发朋友圈噻~'
							cancelText: '好哒'
							cancelColor: '#F3944E'
							confirmText:'许愿去'
							success: (res) =>
								if res.confirm
									wx.removeStorage
										key: 'main'
										success: =>
											wx.redirectTo
												url: '/pages/regist/main'

