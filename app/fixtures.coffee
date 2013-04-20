App.Task.FIXTURES = [
	{
		id: 1
		name: 'Wash Dishes'
		details: 'Throw them away'
		tags: [1]
		priority: 1
		updates: [1, 2]
	}
	{
		id: 2
		name: 'Take out trash'
		details: 'Wash it first'
		tags: [1]
		priority: 5
	}
	{
		id: 3
		name: 'Select motherboard'
		details: 'I want it to be < $200 and rectangular'
		tags: [2]
		priority: 3
	}
	{
		id: 4
		name: 'Select case'
		details: 'Should look like a gilded lemur'
		tags: [2]
		priority: 2
	}
	{
		id: 5
		name: 'Add slick deals alert'
		details: 'Set an alert when ANYTHING is posted to slickdeals.  For safety.'
		tags: [2]
		priority: 4
	}
]

App.Update.FIXTURES = [
	{
		id: 1
		task: 1
		details: 'Started loading the dishwasher'
		createdAt: new Date('2013-04-19T20:00:00Z')
	}
	{
		id: 2
		task: 1
		details: 'Set the dishwasher running'
		createdAt: new Date('2013-04-20T10:35:00Z')
	}
]

App.Tag.FIXTURES = [
	{
		id: 1
		name: 'Chores'
		tasks: [1,2,3]
	}
	{
		id: 2
		name: 'Computer Build'
		tasks: [4,5]
	}
]