class Server < ActiveRecord::Base
  has_many :email, dependent: :destroy
  has_many :acesso
  has_many :click
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
  
  def click_dia()
    total_click = click.where(data: Date.today.strftime).count
    return total_click
  end
  
  def click_semana()
    total_click_semana =  click.where("data >= ? AND data < ?", Date.today.at_beginning_of_week.strftime, Date.today.at_end_of_week.strftime).count
    return total_click_semana
  end
  
  def click_mes()
    total_click_mes = click.where('extract(month from data) = ?', Date.today.month).count
    return total_click_mes
  end
 

  
 
end
