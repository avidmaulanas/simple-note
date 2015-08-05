jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

window.fbAsyncInit = ->
  FB.init
    appId: '869365006489696'
    xfbml: true
    version: 'v2.4'
  return

((d, s, id) ->
  js = undefined
  fjs = d.getElementsByTagName(s)[0]
  if d.getElementById(id)
    return
  js = d.createElement(s)
  js.id = id
  js.src = '//connect.facebook.net/en_US/sdk.js'
  fjs.parentNode.insertBefore js, fjs
  return
) document, 'script', 'facebook-jssdk'
