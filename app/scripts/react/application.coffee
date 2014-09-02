#= require react
#= require react-mixin-manager
#= require react_ujs
#= require_tree ./components

window.ReactApp =
  start: ->
    console.log 'ReactApp start'

    $(document).on 'page:change', ReactUjs.mountReactComponents

$ -> ReactApp.start()
