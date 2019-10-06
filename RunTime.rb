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