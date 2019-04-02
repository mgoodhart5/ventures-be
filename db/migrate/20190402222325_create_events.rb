class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :type
      t.integer :price
      t.string :start_date
      t.string :end_date
      t.text :description
      t.string :event_url
      t.string :image_url
      t.string :video_url

      t.timestamps
    end
  end
end
