class Email < ActiveRecord::Base
  belongs_to :server
  has_many :acesso
end
