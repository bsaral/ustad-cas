require 'open-uri'
require 'socket'
require 'cgi'

class ApplicationController < ActionController::Base
  protect_from_forgery

  def yon
    logger.info { "DEBUG: START: yon: devam ... STOP" }
    logger.info { "DEBUG: START: yon: #{request.remote_ip.inspect} ... STOP" }


    @user = User.find(session["warden.user.user.key"][1][0])

    render text: "<h3>Tam olarak istediginiz nedir?</h3>" +
                 "<li><a href=#{session[:user_return_to]}>Url yoluyla istediginiz, normal sartlarda doneceginiz sayfa</a>" +
                 "<li><a href=#{my_route_to(request.remote_ip)}>Client'inizin bulungugu aga ait ustad</a>" +
                 "<li><a href=#{my_institution_to(@user)}>Kullanici olarak bagli oldugunuz ustad</a>"

    #@redirect_to = session[:user_return_to]
    #redirect_to session[:user_return_to]
  end

  private
    def my_request_to(user_return_to)
      CGI.parse(URI.parse(user_return_to).query)['redirect_uri'][0]
    end

    def my_route_to(ip)
      #FIXME: access_pool'dan ip2institution2route_to
      "http://ustad.gop.edu.tr"
    end

    def my_institution_to(user)
      user.institution.route_to
    end

    # - user_return_to > redirect_uri: CGI:parse
    # - redirect_uri > uri: URI:decode + URI:parse
    def get_request_net_ip(user_return_to)
      redirect_uri = my_request_to(user_return_to)
      uri = URI::parse(URI::decode(redirect_uri))
      Socket.getaddrinfo(uri.host, uri.scheme)[0][2]
    end
end
