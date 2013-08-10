class AddVisualizacaoToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :visualizacao, :integer
  end
end
