class Institution < ActiveRecord::Base
  attr_accessible :name, :route_to
  has_many :users, dependent: :destroy
end
