Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |config|
    config.path_prefix = '/auth'
  end

  provider :facebook, '251388158310534', '453fdb776a9bfed8d8350c0ab897a22a' 
  #provider :google, 'emineker.net', 'PtyLaRmzLQ1LodMJVrmYdt3b'
  #provider :twitter, 'twitter-appid', 'twitter-app-secret'
end
