class Client < ActiveRecord::Base
  attr_accessible :name, :app_id, :app_secret 

  def self.authenticate(app_id, app_secret)
    where(["app_id = ? AND app_secret = ?", app_id, app_secret]).first
  end
end
