App.TagsController = Ember.ArrayController.extend {
	filterOn: null

	setFilterOn: (tagId)->
		if this.get('filterOn') == tagId
			this.set 'filterOn', null
		else
			this.set 'filterOn', tagId

	setActiveTag: (->
		content = this.get 'content'
		filterOn = this.get 'filterOn'

		content.setEach('active', false)

		if filterOn
			activeTag = content.findProperty('id', filterOn)
			activeTag.set('active', true)

		).observes('filterOn')
	}