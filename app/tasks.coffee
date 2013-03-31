App.TasksRoute = Ember.Route.extend {
	model: ->
		return App.Task.find()
	}

App.TasksNewRoute = Ember.Route.extend {
	setupController: (controller, model) ->
		controller.set 'name', 'Name this task'
		controller.set 'details', 'Describe this task'
	}

App.TasksNewController = Ember.ObjectController.extend {
	name: '',
	details: ''

	createTask: ->
		newTask = App.Task.createRecord {
			name: this.get('name')
			details: this.get('details')
			}

		this.get('target').transitionTo('task', newTask)
	}

App.TaskController = Ember.ObjectController.extend {
	deleteTask: ->
		this.get('content').deleteRecord();
		this.get('target').transitionTo('tasks')
	}