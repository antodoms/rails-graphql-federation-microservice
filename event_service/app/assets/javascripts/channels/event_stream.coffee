App.event_stream = App.cable.subscriptions.create "EventStreamChannel",
  connected: ->
    console.log("connected")

  disconnected: ->
    console.log("disconnected")

  received: (data) ->
    console.log(data)
    fetchData()
    showEvents()
