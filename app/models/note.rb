class Note < ActiveRecord::Base
	belongs_to :user

	validates :content, presence: true, format: { with: /\w/ }, 
		length: { maximum: 100, tokenizer: lambda { |str| str.scan(/\w+/) }, too_long: "must have at most %{count} words" }

	auto_html_for :content do
    html_escape
    image
    youtube(:width => 400, :height => 250, :autoplay => true)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end


end
