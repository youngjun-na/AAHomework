module ApplicationHelper
  def auth_token
   html = '<input type= "hidden">'
  html += "<name=\"authenticity_token\">"
  html += " <value =\"#{form_authenticity_token}\" />"
  html.html_safe
  end
end

"<img src=\"#{user.picture_url}\" alt=\"#{h(user.name)}\">"