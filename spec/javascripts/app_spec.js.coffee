describe 'App', ->
  it 'sets el', ->
    app = new App({el: $("#app")})
    expect(app.el).toEqual $('#app')

