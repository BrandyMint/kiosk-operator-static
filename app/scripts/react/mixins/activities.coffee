ERROR_TIMEOUT = 1000

BaseMixin =
  setActivitiesHandler: (handler) ->
    @activitiesHandler   = handler
    @hasActivities       = handler.hasActivities
    @incrementActivities = handler.increment
    @decrementActivities = handler.decrement

# TODO React.PropsTypes.activitiesHandler
# TODO Создавать объект типа ActivitiesHandler один раз и в следующий раз отдавать кешированый
ram =
  componentWillMount: ->
    @setActivitiesHandler @createActivitiesHandler()

  getInitialState: ->
    activities: 0

  incrementActivities: -> @activitiesHandler.incrementActivities
  decrementActivities: -> @activitiesHandler.decrementActivities

  createActivitiesHandler: ->
    increment = (-> _.defer => @setState activities: ++@state.activities).bind @
    decrement = (-> _.defer => @setState activities: --@state.activities).bind @
    hasActivities = ( -> @state.activities > 0 ).bind @
    activities = ( -> @state.activities ).bind @

    { increment, decrement, hasActivities, activities }

# Добавляется тому, кто активитисы принимает
rau =
  componentWillMount: ->
    @setActivitiesHandler @props.activitiesHandler

  componentWillReceiveProps: (nextProps) ->
    @setActivitiesHandler nextProps.activitiesHandler

window.ReactActivitiesMixin = _.extend {}, BaseMixin, ram
window.ReactActivitiesUser = _.extend {}, BaseMixin, rau