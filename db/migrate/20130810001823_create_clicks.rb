class CreateClicks < ActiveRecord::Migration
  def up
    create_table :clicks do |t|
      t.string :ip
      t.integer :time
      t.integer :server_id
      t.date :data
      t.timestamps
    end
  end
  def down
    drop_table :clicks
  end
end
