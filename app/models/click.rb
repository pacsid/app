class Click < ActiveRecord::Base
  belongs_to :server
  belongs_to :email
end
