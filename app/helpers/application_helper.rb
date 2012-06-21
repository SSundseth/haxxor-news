module ApplicationHelper

  def pretty_time(time)
    diff_seconds = Time.now - time
    case diff_seconds
      when 0 .. 59
        "#{(diff_seconds).to_i} seconds ago"
      when 60 .. (3600-1)
        "#{(diff_seconds/60).to_i} minutes ago"
      when 3600 .. (3600*24-1)
        "#{(diff_seconds/3600).to_i} hours ago"
      when (3600*24) .. (3600*24*30) 
        "#{(diff_seconds/(3600*24)).to_i} days ago"
      else
        time.strftime("%m/%d/%Y")
    end
  end
end
