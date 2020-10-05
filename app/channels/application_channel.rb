class ApplicationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "application-stream"
  end
end
