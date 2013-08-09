class Server < ActiveRecord::Base
  has_many :email, dependent: :destroy
end
