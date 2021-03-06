module ApplicationHelper
  def login_helper
    if current_user
      link_to 'Logout', destroy_user_session_path, class: 'nav-link', method: :delete
    else
      (link_to 'Sign Up', new_user_registration_path, class: 'nav-link') + ''.html_safe +
        + (link_to 'Login', new_user_session_path, class: 'nav-link')
      end
  end

  def source_helper
    content_tag(:p, "Thanks for visiting us from #{session[:source]}", class: 'source-greeting') if session[:source]
  end

  def active?(path)
    'active' if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    alert_generator alert if alert
  end

  def alert_generator(msg)
    js add_gritter(msg, title: 'Brainstack', sticky: false, time: 1000)
  end
end
