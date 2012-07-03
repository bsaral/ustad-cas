class User < ActiveRecord::Base
  has_many :authentications, dependent: :delete_all
  has_many :access_grants, dependent: :delete_all

  before_validation :initialize_fields, on: :create

  devise :database_authenticatable, :token_authenticatable,
         :timeoutable, :trackable, authentication_keys: [:login]

  self.token_authentication_key = "oauth_token"

  attr_accessor :login
  attr_accessible :login, :email, :username, :password, :password_confirmation

  def apply_omniauth(omniauth)
    authentications.build(provider: omniauth['provider'], uid: omniauth['uid'])
  end

  def self.find_for_token_authentication(conditions)
    where(["access_grants.access_token = ? AND (access_grants.access_token_expires_at IS NULL OR access_grants.access_token_expires_at > ?)", 
          conditions[token_authentication_key], Time.now]).joins(:access_grants).select("users.*").first
  end

  def initialize_fields
    self.status = "Active"
    #self.expiration_date = 1.year.from_now
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
