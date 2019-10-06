class AdminCommands
	include Cinch::Plugin
	match /join (.+)/, method: :Joincommand
	match /send (.+)/, method: :Sendcommand
	@admins = ['nsafunded', 'boahs', 'gvjordan']
	def Joincommand(m, arg)
		nick = m.user.nick
		if @admins.include(m.user.nick)?
			Channel(arg).join
		end
	end
	def Sendcommand(m, arg)
		if @admins.include(m.user.nick)?
			args = arg.split(" ")
			chan = args[0]
			args.shift()
			msg = args.join(" ")
			Channel(chan).send(msg)
		end
	end
end