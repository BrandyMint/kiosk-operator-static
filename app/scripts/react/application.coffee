#= require react
#= require react-mixin-manager
#= require react_ujs
#= require_tree ./services
#= require_tree ./mixins
#= require_tree ./components
#= require_tree ./controllers

window.ReactApp =
  start: ->
    console.log 'ReactApp start'

    $(document).on 'page:change', ReactUjs.mountReactComponents

$ -> ReactApp.start()
