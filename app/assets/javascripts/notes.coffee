# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).load -> 
  $container = $('.infinite-notes')

  $container.masonry
    itemSelector: '.box'
    columnWidth: '.box'
  return

$(document).bind "page:load page:change", ->
  $container = $('.infinite-notes')

  $container.masonry
    itemSelector: '.box'
    columnWidth: '.box'

  $container.infinitescroll {
    navSelector: '.pagination'
    nextSelector: '.pagination a'
    itemSelector: '.box'
    loading:
      msgText: ''
      finishedMsg: ''
      img: gon.ajax_loader_path

  }, (newElements) ->
    # hide new items while they are loading
    $newElems = $(newElements).css(opacity: 0)
    $newElems.animate opacity: 1
    $container.masonry 'appended', $newElems, true
    return
  return