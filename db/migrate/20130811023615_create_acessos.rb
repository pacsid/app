class CreateAcessos < ActiveRecord::Migration
  def up
    create_table :acessos do |t|
      t.integer :server_id
      t.integer :email_id
      t.string  :ip
      t.date :data
      
      t.timestamps
    end
  end
  def down
   drop_table :acessos
  end
end
