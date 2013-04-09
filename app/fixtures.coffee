App.Task.FIXTURES = [
	{
		id: 1
		name: 'Wash Dishes'
		details: 'Throw them away'
		tags: [1]
	}
	{
		id: 2
		name: 'Take out trash'
		details: 'Wash it first'
		tags: [1]
	}
	{
		id: 3
		name: 'Select motherboard'
		details: 'I want it to be < $200 and rectangular'
		tags: [2]
	}
	{
		id: 4
		name: 'Select case'
		details: 'Should look like a gilded lemur'
		tags: [2]
	}
	{
		id: 5
		name: 'Add slick deals alert'
		details: 'Set an alert when ANYTHING is posted to slickdeals.  For safety.'
		tags: [2]
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