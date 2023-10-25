class LogLineParser
  attr_reader :log_level, :message

  def initialize(line)
    @log_level, @message = line.split(':')
    @log_level = @log_level[1..-2].downcase
    @message.strip!
  end

  def reformat
    "#{@message} (#{@log_level})"
  end
end
