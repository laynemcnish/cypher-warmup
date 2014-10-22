class MessageEncryptor

  def initialize(message)
    @message = message
  end

  def prepare_message
    @message.gsub!(/[\d|\s|\W]+/, "")
    @message = @message.scan(/.{1,5}/)
    while @message[-1].length < 5
      @message[-1] += "X"
    end
    @message.join(" ").upcase!
  end

end

message = "He454@#llo W209rl!d What0290329s up?2032093"

p MessageEncryptor.new(message).prepare_message