App.status = App.cable.subscriptions.create "StatusChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('status channel: ', 'connected')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('status channel: ', 'disconnected')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log('status channel: ', 'data received', data)
    alert data
