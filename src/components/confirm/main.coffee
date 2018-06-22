import closeImg from '@/assets/close.png'

export default
	props:
		title: String
		show: Boolean
		marks: Array

	data: -> {
		closeImg
		price: ''
		currentMarkIndex: 0
	}

	methods:
		clickConfirm: ->
			this.$emit 'confirm',
				price: parseFloat(this.price) * 1000 // 100 / 10
				mark: this.marks[this.currentMarkIndex]
			this.$emit 'close'