class Dashing.Stpresence extends Dashing.Widget
  constructor: ->
    super
    @queryState()

  @accessor 'state',
    get: -> @_state ? "Unknown"
    set: (key, value) -> @_state = value

  @accessor 'icon',
    get: -> if @get('state') == 'present' then 'map-marker' else 'map-marker'
    set: Batman.Property.defaultAccessor.set

  @accessor 'icon-style', ->
    if @get('state') == 'present' then 'icon-present' else 'icon-absent'
<<<<<<< HEAD
  
=======

>>>>>>> 865abc46ee97c0de97d1e092b5c4eeab7b24c2d8
  queryState: ->
    $.get '/smartthings/dispatch',
      widgetId: @get('id'),
      deviceType: 'presence',
      deviceId: @get('device')
      (data) =>
        json = JSON.parse data
        @set 'state', json.state

  ready: ->

  onData: (data) ->
