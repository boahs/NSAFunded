class TimedPlugin
  include Cinch::Plugin

  timer 5, method: :timed
  def timed
    Channel("#swiftbot2").send "5 seconds have passed"
  end
end