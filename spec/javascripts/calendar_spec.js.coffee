describe 'Calendar', ->
  it 'sets the title', ->
    calendar = new App.Calendar(title: "Work Cal")
    expect(calendar.title).toEqual 'Work Cal'
