class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email
      t.date :data
      t.integer :server_id

      t.timestamps
    end
  end
  def down
    drop_table :emails
  end
end
