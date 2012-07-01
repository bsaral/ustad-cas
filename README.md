# Ustad CAS

Authentication gerektiren servisler buradan yetkilenecekler.

Olgunlaşma evresinde ki [provider](https://github.com/19test/sso-devise-omniauth-provider) ve
[client](https://github.com/19test/sso-devise-omniauth-client).


# Kurulum

Ayrıntıları,

    $ git clone git@github.com:19/ustad-cas.git
    $ git checkout master
    $ bundle install
    rake db:create
    rake db:migrate
    rake db:seed

Create your Twitter App and Facebook App. Create the initializer file with the following omniauth configuration:( eg. I use config/initializers/omniauth.rb )

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :twitter, 'twitter-appid', 'twitter-app-secret'
      provider :facebook, 'facebook-appid', 'facebook-app-secret'
    end

That's it! Your on your way:

    rails server

In your browser, go for it:

    http://localhost:3000

# Contributions

Please feel free to enhance this demo.
For any doubts, please send an email to gautam@joshsoftware.com

I am eager to write some rspec for this setup. If you do, please send me a pull request!
