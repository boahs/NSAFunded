class NSA
  include Cinch::Plugin
  listen_to :message, method:  :on_message
  match /ITTchat (.+)/, method: :ITTchat
  def on_message(m)
    con = Mysql.new('localhost', 'ittbot', 'ittbot1', 'ittbot')
    time = Time.now.to_i
    channel = m.channel
    user = m.user.nick
    msg = m.message
    res = con.query("INSERT INTO chat (time, channel, user, msg) VALUES ('#{time}', '#{channel}', '#{user}', '#{msg}')")
  end
end
