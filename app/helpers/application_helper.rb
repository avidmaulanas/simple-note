module ApplicationHelper
	def active_class(link_path)
		current_page?(link_path) ? "active" : ""
	end

	def paginate(objects, options = {})
    options.reverse_merge!( theme: 'twitter-bootstrap-3', pagination_class: 'pagination-centered'  )

    super( objects, options )
  end

	def time_formatted(datetime)
		date = datetime.in_time_zone(cookies["time_zone"])
		if date >= 7.days.ago
			"#{time_ago_in_words(date)} ago"
		elsif date.strftime("%Y-%m-%d").eql? Date.yesterday.in_time_zone(cookies["time_zone"])
			"on Yesterday"
		else
			"on #{date.strftime("%d %b %Y &#8226; %H:%M")}".html_safe
		end
	end

	def alert_for(flash_type)  
	  { success: 'alert-success',
	    error: 'alert-danger',
	    alert: 'alert-warning',
	    notice: 'alert-info'
	  }[flash_type.to_sym] || flash_type.to_s
	end 

	def flash_messages
		flash.each do |name, msg|
      concat(content_tag(:div, msg, class: [:alert, alert_for(name)]) do
        concat(content_tag(:button, type: "button", class: "close", data: {dismiss: "alert"}, aria: {label: "Close"}) do
          concat content_tag(:span, '&times;'.html_safe, aria: {hidden: "true"})
        end)
        concat msg
      end)
    end
    nil
	end
end
