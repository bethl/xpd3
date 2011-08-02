module ApplicationHelper
  

   def client_browser_name
      user_agent = request.env['HTTP_USER_AGENT'].downcase
    if user_agent =~ /msie 8/i
      "ie8"
    elsif user_agent =~ /msie 7/i
      "ie7"
    elsif user_agent =~ /msie 6/i
      "ie6"
    elsif user_agent =~ /konqueror/i
      "konqueror"
    elsif user_agent =~ /gecko/i
      "mozilla"
    elsif user_agent =~ /opera/i
      "opera"
    elsif user_agent =~ /applewebkit/i
      "safari"
    else
      "unknown"
    end
  end

end
