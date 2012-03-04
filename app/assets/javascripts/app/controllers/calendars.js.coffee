$ = jQuery.sub()
Calendar = App.Calendar

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Calendar.find(elementID)

class New extends Spine.Controller
  events:
    'click [data-type=back]': 'back'
    'submit form': 'submit'
    
  constructor: ->
    super
    @active @render
    
  render: ->
    @html @view('calendars/new')

  back: ->
    @navigate '/calendars'

  submit: (e) ->
    e.preventDefault()
    calendar = Calendar.fromForm(e.target).save()
    @navigate '/calendars', calendar.id if calendar

class Edit extends Spine.Controller
  events:
    'click [data-type=back]': 'back'
    'submit form': 'submit'
  
  constructor: ->
    super
    @active (params) ->
      @change(params.id)
      
  change: (id) ->
    @item = Calendar.find(id)
    @render()
    
  render: ->
    @html @view('calendars/edit')(@item)

  back: ->
    @navigate '/calendars'

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(e.target).save()
    @navigate '/calendars'

class Show extends Spine.Controller
  events:
    'click [data-type=edit]': 'edit'
    'click [data-type=back]': 'back'

  constructor: ->
    super
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = Calendar.find(id)
    @render()

  render: ->
    @html @view('calendars/show')(@item)

  edit: ->
    @navigate '/calendars', @item.id, 'edit'

  back: ->
    @navigate '/calendars'

class Index extends Spine.Controller
  events:
    'click [data-type=edit]':    'edit'
    'click [data-type=destroy]': 'destroy'
    'click [data-type=show]':    'show'
    'click [data-type=new]':     'new'

  constructor: ->
    super
    Calendar.bind 'refresh change', @render
    Calendar.fetch()
    
  render: =>
    calendars = Calendar.all()
    @html @view('calendars/index')(calendars: calendars)
    
  edit: (e) ->
    item = $(e.target).item()
    @navigate '/calendars', item.id, 'edit'
    
  destroy: (e) ->
    item = $(e.target).item()
    item.destroy() if confirm('Sure?')
    
  show: (e) ->
    item = $(e.target).item()
    @navigate '/calendars', item.id
    
  new: ->
    @navigate '/calendars/new'
    
class App.Calendars extends Spine.Stack
  controllers:
    index: Index
    edit:  Edit
    show:  Show
    new:   New
    
  routes:
    '/calendars/new':      'new'
    '/calendars/:id/edit': 'edit'
    '/calendars/:id':      'show'
    '/calendars':          'index'
    
  default: 'index'
  className: 'stack calendars'