class Server < ActiveRecord::Base
  has_many :email, dependent: :destroy
  def total_visualizacoes(id)
    server = Server.find(id)
    @total = 0
    server.email.each do |email|
      unless email.visualizacao.nil?
        @total += email.visualizacao
      end
    end
    return @total
  end
end
