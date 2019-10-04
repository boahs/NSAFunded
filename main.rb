require 'cinch'
require 'async'
require 'open-uri'
require 'mysql-'

$start_time = Time.now.getutc

class RunTime
  include Cinch::Plugin
  match "runtime"
  def execute(m)
    now_time = Time.now.getutc
    diff_time = now_time - $start_time
    mm, ss = diff_time.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    m.reply "#{dd} days, #{hh} hours, #{mm} minutes, #{ss} seconds."
  end
end

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.swiftirc.net"
    c.nick = "swiftbot3"
    c.user = "swiftbot3"
    c.channels = ["#swiftbot2"]
    c.verbose
    c.plugins.plugins = [RunTime]
  end


# Auto Voice bot will need OP status 
# Enable with !autovoice on
# disable with !autovoice off
# Default will be !autovoice off 

  on :join do |n|
    unless n.user.nick == bot.nick 
    n.channel.voice(n.user) if @autovoice
    end
  end

  on :channel, /^!autovoice (on|off)$/ do |n, option|
    @autovoice = option == "on"
    n.reply "Autovoice is now #{@autovoice}" ? 'enabled' : 'disabled'
  end
end

class TimedPlugin
  include Cinch::Plugin

  timer 5, method: :timed
  def timed
   Channel("#swiftbot2").send "5 seconds have passed"
    end
  end
  
    

 
bot.start

