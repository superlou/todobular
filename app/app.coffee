window.App = Ember.Application.create()

# Models
App.Store = DS.Store.extend {
	revision: 12
	adapter: 'DS.FixtureAdapter'
	}

App.Task = DS.Model.extend {
	name: DS.attr 'string', {defaultValue: 'Enter a task name'}
	details: DS.attr 'string', {defaultValue: 'Describe the task'}
	tags: DS.hasMany 'App.Tag'
	priority: DS.attr 'number', {defaultValue: 0}
	}

App.Tag = DS.Model.extend {
	name: DS.attr 'string'
	tasks: DS.hasMany 'App.Task'
	}

# Application
App.ApplicationRoute = Ember.Route.extend {
	setupController: ->
		this.controllerFor('tags').set('model', App.Tag.find())
	}