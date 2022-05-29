Thread.new do
  change_stream = Event.collection.watch
  loop do
    if doc = change_stream.try_next
      ActionCable.server.broadcast "event_stream_channel",
                                    content: doc
    else
      sleep 1
    end
  end
end