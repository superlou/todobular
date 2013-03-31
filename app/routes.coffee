App.Router.map ->
	this.resource "tasks", ->
		this.resource "task", {path: "/:task_id"}
		this.route('new')

App.IndexRoute = Ember.Route.extend {
	redirect: ->
		this.transitionTo('tasks')
	}