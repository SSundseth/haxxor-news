module ApplicationHelper

  def pretty_time
    diff_seconds = Time.now - Object.created_at
    case diff_seconds
      when 0 .. 59
        puts "#{(diff_seconds).to_i} seconds ago"
      when 60 .. (3600-1)
        puts "#{(diff_seconds/60).to_i} minutes ago"
      when 3600 .. (3600*24-1)
        puts "#{(diff_seconds/360).to_i} hours ago"
      when (3600*24) .. (3600*24*30) 
        puts "#{(diff_seconds/(3600*24)).to_i} days ago"
      else
        puts start_time.strftime("%m/%d/%Y")
    end
  end
end
