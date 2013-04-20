App.TaskUpdatesController = Ember.ArrayController.extend {
	needs: ['task']
	taskBinding: 'controllers.task.model'

	sortProperties: ['createdAt']
	sortAscending: false

	newUpdateDetails: ""

	createUpdate: ->
		transaction = @store.transaction()
		transaction.add @get('task')
		transaction.createRecord(App.Update, {
				details: @get('newUpdateDetails')
				task: @get('task')
				createdAt: new Date()
			})
		@set('newUpdateDetails', '')
		transaction.commit()
}

App.TaskUpdatesView = Ember.View.extend {
	templateName: 'task-updates'
}

App.TaskUpdatesListView = Ember.CollectionView.extend {
	classNames: ['task-updates']

	contentBinding: 'controller'

	itemViewClass: Ember.View.extend({
		templateName: 'task-updates-item'

		didInsertElement: -> 
			$('.updates textarea').autosize({append: "\n"})

			# Hack to not transition textarea height on creation
			setTimeout ->
					$('.updates textarea').addClass('transition')
				, 1000

			this._super()
	})
}