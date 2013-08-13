class Email < ActiveRecord::Base
  belongs_to :server
  has_many :acesso
  has_many :click
end
