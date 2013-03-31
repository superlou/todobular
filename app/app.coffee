window.App = Ember.Application.create()

# Models
App.Store = DS.Store.extend({
	revision: 11,
	adapter: 'DS.FixtureAdapter'
	})

App.Task = DS.Model.extend {
	name: DS.attr 'string', {defaultValue: 'Enter a task name'}
	details: DS.attr 'string', {defaultValue: 'Describe the task'}
	}