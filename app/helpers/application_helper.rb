module ApplicationHelper
  delegate :url_helpers, to: 'Rails.application.routes'
  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    active_class = html_options[:active] || 'active'
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
    link_to(name, options, html_options, &block)
  end

  def flash_class(level)
    case level
    when 'notice' then 'alert alert-info'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-danger'
    when 'alert' then 'alert alert-danger'
    when 'recaptcha_error' then 'alert alert-danger'
    end
  end

end
