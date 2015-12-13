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
end
