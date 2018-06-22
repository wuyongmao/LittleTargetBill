import closeImg from '@/assets/close.png'

export default
	props:
		title: String
		show: Boolean
		marks: Array

	data: -> {
		closeImg
		money: ''
		currentMarkIndex: 0
	}

	methods:
		clickConfirm: ->
			this.$emit 'confirm',
				money: this.money
				mark: this.marks[this.currentMarkIndex]
			this.$emit 'close'