bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.chat.twitch.tv"
    c.nick = "nsafunded"
    c.user = "nsafunded"
    c.realname = "nsafunded"
    c.password = 'nope.jpg'
    c.channels = ["#gvjordan"]
    c.verbose
    c.plugins.plugins = [RunTime, NSA, AdminCommands]
    end
  end

bot.start

=begin
@threads = []

10.times {
	@threads << Thread.new { 
		bot.start
		sleep 0.1
	}
}

@threads << Thread.new {
  bot = Cinch::Bot.new do
    configure do |c|
      c.server = "irc.chat.twitch.tv"
      c.nick = "nsafunded"
      c.user = "nsafunded"
			c.realname = "nsafunded"
			c.password = 'nope.jpg'
      c.channels = ["#gvjordan"]
      c.verbose
      c.plugins.plugins = [RunTime, ITT, SendMessage, AdminCommands]
    end
  end
  bot.start
}
sleep 5
@threads.each(&:join)
=end