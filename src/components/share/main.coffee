import group from '@/assets/group.png'
import qr from '@/assets/qr.jpg'

export default
	props:
		main: Object
		totalDays: Number
	mounted: ->
		this.draw()

	methods:
		draw: ->
			ctx = wx.createCanvasContext 'shareCanvas'

			# 绘制背景色
			ctx.setFillStyle('white')
			ctx.fillRect(0, 0, 320, 512)

			# 绘制图片
			ctx.drawImage(group, 23, 23, 274, 268)
			ctx.drawImage(qr,  218, 342, 88, 88)

			# 绘制文本
			fontSize = 20
			initialTop = 340
			marginTop = 8
			date = (new Date()).toLocaleString().match(/\d{4}\/\d{1,2}\/\d{1,2}/)[0]
			ctx.setFontSize(fontSize)
			ctx.setFillStyle('#F3944E')
			ctx.fillText(date, 16, initialTop)
			ctx.fillText('用愿望账单记账的第', 16, initialTop + (marginTop + fontSize) * 1)
			ctx.fillText(this.totalDays + '天', 16, initialTop + (marginTop + fontSize) * 2)
			ctx.fillText('成功存下了' + this.main.budget + '元', 16, initialTop + (marginTop + fontSize) * 3)
			ctx.fillText(this.main.target + '的梦想基金', 16, initialTop + (marginTop + fontSize) * 4)
			ctx.draw()