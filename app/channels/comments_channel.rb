class CommentsChannel < ApplicationCable::Channel
  def subscribed
    # called whenever an user subscribes to the channel
    stream_from "comments"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
