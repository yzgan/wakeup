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
    elementId = 'toast-' + Date.now()
    @appendline(data, elementId)
    $("#" + elementId).toast('show')

  appendline: (data, elementId) ->
    html = @createLine(data, elementId)
    $('.toast-container').append(html)
    
  createLine: (data, elementId) ->
    """
    <div id="#{elementId}" class="toast" aria-atomic="true" aria-live="assertive" role="alert" data-delay="10000" style="min-width: 200px;">
      <div class="toast-header">
        <strong class="mr-auto px-3">Newn Status Update</strong>
        <small class="text-muted ml-3">just now</small>
        <button class="ml-2 mb-1 close" aria-label="Close" data-dismiss="toast" type="button">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="toast-body">
        #{data["message"]}
      </div>
    </div>
    """