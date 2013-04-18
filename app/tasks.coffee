App.TasksRoute = Ember.Route.extend {
	model: ->
		return App.Task.find()
	}
 
# App.TaskRoute = Ember.Route.extend {
# 	model: (params)->
# 		task = App.Task.find(params.task_id)
 
# 		console.log(task.get('isNew'))
 
# 		return task
# 	}
 
App.TasksNewRoute = Ember.Route.extend {
	setupController: (controller, model) ->
		controller.set 'name', 'Name this task'
		controller.set 'details', 'Describe this task'
	}
 
App.TasksNewController = Ember.Controller.extend {
	name: ''
	details: ''
 
	needs: ['tags']
	filterOnBinding: 'controllers.tags.filterOn'
 
	createTask: ->
		if this.get 'filterOn'
			tags = [this.get 'filterOn']
		else
			tags = []
 
		testTag = App.Tag.find(1)
 
		newTask = App.Task.createRecord {
			name: this.get('name')
			details: this.get('details')
			#tags: [testTag] #<-- Wish I knew why this doesn't work
			}
 
		for tagId in tags
			newTask.get('tags').pushObject(App.Tag.find(tagId))
 
		this.get('target').transitionTo('task', newTask)
	}
 
App.TasksController = Ember.ArrayController.extend {
	needs: ['tags']
	filterOnBinding: 'controllers.tags.filterOn'
 
	filteredContent: (->
		content = this.get 'content'
		filterOn = this.get 'filterOn'
 
		if filterOn
			filtered = content.filter( (task)->
				taskTagIds = task.get('tags').mapProperty('id')
 
				return taskTagIds.contains(filterOn)
				)
			return filtered
		else
			return content
 
	).property('content', 'filterOn', 'content.@each.tags')
	}



App.TasksListController = Ember.ArrayController.extend {
	needs: ['tasks']
	contentBinding: 'controllers.tasks.filteredContent'
	sortProperties: ['priority']
	sortAscending: false

	# todo Make this smarter
	updatePrioritiesByOrder: (orderedTasks)->
		currentPriority = orderedTasks.get('length')

		orderedTasks.forEach( (item, index) ->
				item.set('priority', currentPriority--)
			)
}
 
App.TasksListView = Ember.CollectionView.extend {
	tagName: 'ul'
	classNames: ['tasks-list']

	itemViewClass: Ember.View.extend({
    	templateName: 'tasks-list-item'
  	})

	contentBinding: 'controller'
 
	didInsertElement: ->
		this._super();
		self = this
		this.$().sortable({update: (event, ui)->
			domTasks = ui.item.parent().children()
			domTasks = Ember.A($.makeArray(domTasks))

			orderedTasks = domTasks.map( 
				(item, index) ->
					return Ember.View.views[item.id].get('content')
				)

			
			self.controller.updatePrioritiesByOrder(orderedTasks)
			})

		this.$().disableSelection()
}
 
App.TaskController = Ember.ObjectController.extend {
	triggerAutosize: (->
		$('.details textarea').trigger('autosize');
		).observes('content.details')
 
	deleteTask: ->
		this.get('content').deleteRecord();
		this.get('target').transitionTo('tasks')
	}
 
Ember.TextArea.reopen {
	didInsertElement: ->
		$('.details textarea').autosize({append: "\n"})
 
		# Hack to not transition textarea height on creation
		setTimeout ->
				$('.details textarea').addClass('transition')
			, 1000
 
		this._super()
}