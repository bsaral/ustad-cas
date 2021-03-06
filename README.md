# Ustad CAS

Authentication gerektiren servisler buradan yetkilenecekler.

# Kurulum

Ayrıntıları,

    $ git clone git@github.com:ustad-us/ustad-cas.git
    $ git checkout master
    $ bundle install

## Konfigürasyon

- Veritabanı, `config/database.sample.yml` dosyasını `config/database.yml` olarak
kopyalayın ve kişiselleştirin. Gerekli veritabanlarını oluşturun.

- Omniauth, `config/initializers/omniauth.sample.rb` dosyasını
  `config/initializers/omniauth.rb` kopyasını üretin ve kişiselleştirin.

Konsol,

    $ rake db:migrate
    $ rake db:seed

## İstemciler

Her bir istemci için,

### İSTEMCİ / Client

FIXME: bu [commit](https://github.com/19/osce/commit/c5735b9b245915dea6b13778c9be32d7fb5b90d0) 
mesajında ayrıntılandırıldığı üzere daha fazlasına ihtiyaç duyulmaktadır. Buna göre aşağısı yetersizdir!

İstenci tarafında yapılacak ayarlar.

1. `config/omniauth.yml` dosyasını üretin. örnek:
   [omniauth.sample.yml](https://gist.github.com/71b66aa9693aa2e78260)

2. Gemfile'ınıza `gem 'omniauth'` ve `gem 'omniauth-oauth2'`'i ekleyin.

3. `config/initializers/omniauth.rb` dosyasını oluşturun. Örneğin: [omniauth](https://gist.github.com/ca7be91e6541b1fa4368)

4. SessionController'u ayarlayın. Örnek:
   [user_sessions_controller](https://gist.github.com/039d73fc7b2a37f57536)

### SUNUCU / Provider

Sunucu tarafında yapılacak ayarlar.

Konsol yardımıyla `config/omniauth.yml`'da verdiğiniz APP_ID ve APP_SECRET ile
bir `Client` oluştrun.

   !ruby
   > Client.create(app_id: APP_ID, app_secret: APP_SECRET)
