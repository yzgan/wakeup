App.status = App.cable.subscriptions.create "StatusChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('status channel: ', 'connected')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('status channel: ', 'disconnected')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # StatusChannel.broadcast_to user, beater

    console.log('status channel: ', 'data received', data)
    elementId = 'toast-' + Date.now()
    @appendline(data, elementId)
    @updateTable(data)
    @showToast(elementId)

  updateTable: (data) ->
    element = $('#beater-' + data.id).find('.btn')
    element.html(data.status)
    status = if data.status == 'online' then 'btn-success' else 'btn-danger'
    console.log(data.status, status)
    element.removeClass('btn-danger btn-success').addClass(status)

  appendline: (data, elementId) ->
    html = @createLine(data, elementId)
    $('.toast-container').append(html)
    
  createLine: (data, elementId) ->
    """
    <div id="#{elementId}" class="toast" aria-atomic="true" aria-live="assertive" role="alert" data-delay="10000" style="min-width: 200px; z-index: 2;">
      <div class="toast-header">
        <strong class="mr-auto px-3">Newn Status Update</strong>
        <small class="text-muted ml-3">just now</small>
        <button class="ml-2 mb-1 close" aria-label="Close" data-dismiss="toast" type="button">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="toast-body">
        #{data.name}: #{data.status}
      </div>
    </div>
    """

  showToast: (id) ->
    $("#" + id).toast('show')
