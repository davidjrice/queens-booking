module ApplicationHelper

  def render_flash
    output = ""
    flash.each do |name, msg|
      if msg.is_a?(String)
        output << (content_tag :div, msg, :id => "flash_#{name}", :class => "alert")
      end
    end
    output.html_safe
  end

end
