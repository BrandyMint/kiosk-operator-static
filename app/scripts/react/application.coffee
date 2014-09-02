#= require react
#= require react-mixin-manager
#= require react_ujs
#= require_tree ./components

window.ReactApp =
  start: ->
    console.log 'ReactApp start'

    # ReactUjs доступен только в брендиминтовском репозитории react-rails
    #$(document).on 'page:change', ReactUjs.mountReactComponents

$ -> ReactApp.start()
