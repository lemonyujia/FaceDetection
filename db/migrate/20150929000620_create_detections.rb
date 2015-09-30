class CreateDetections < ActiveRecord::Migration
  def change
    create_table :detections do |t|
      t.integer :user_id
      t.string :glass
      t.string :gender
      t.integer :age
      t.string :race
      t.string :smiling

      t.timestamps null: false
    end
  end
end
