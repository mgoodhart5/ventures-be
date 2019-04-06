class CreateUserEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.integer :status, default: 0
      
      t.timestamps
    end
  end
end
