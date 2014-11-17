class Dashing.Stswitch extends Dashing.Widget
  constructor: ->
    super
    @queryState()

  @accessor 'state',
    get: -> @_state ? 'off'
    set: (key, value) -> @_state = value

  @accessor 'icon',
    get: -> if @['icon'] then @['icon'] else
      if @get('state') == 'on' then @get('iconon') else @get('iconoff')
    set: Batman.Property.defaultAccessor.set

  @accessor 'iconon',
    get: -> @['iconon'] ? 'circle'
    set: Batman.Property.defaultAccessor.set

  @accessor 'iconoff',
    get: -> @['iconoff'] ? 'circle-thin'
    set: Batman.Property.defaultAccessor.set

  @accessor 'icon-style', ->
<<<<<<< HEAD
    if @get('state') == 'on' then 'switch-icon-on' else 'switch-icon-off'    
=======
    if @get('state') == 'on' then 'switch-icon-on' else 'switch-icon-off'
>>>>>>> 865abc46ee97c0de97d1e092b5c4eeab7b24c2d8

  toggleState: ->
    newState = if @get('state') == 'on' then 'off' else 'on'
    @set 'state', newState
    return newState

  queryState: ->
    $.get '/smartthings/dispatch',
      widgetId: @get('id'),
      deviceType: 'switch',
      deviceId: @get('device')
      (data) =>
        json = JSON.parse data
        @set 'state', json.switch

  postState: ->
    newState = @toggleState()
    $.post '/smartthings/dispatch',
      deviceType: 'switch',
      deviceId: @get('device'),
      command: newState,
      (data) =>
        json = JSON.parse data
        if json.error != 0
          @toggleState()

  ready: ->

  onClick: (node, event) ->
    @postState()
