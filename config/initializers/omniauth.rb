Rails.application.config.middleware.use OmniAuth::Builder do
  provider  :facebook, ENV["FACEBOOK_KEY"], ENV["FACEBOOK_SECRET"],
            scope: 'email', info_fields: 'email, name', display: 'popup'
  provider  :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]
  provider  :google, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"]
end
