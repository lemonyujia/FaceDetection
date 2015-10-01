class AddUrlToDetection < ActiveRecord::Migration
  def change
    add_column :detections, :url, :text
  end
end
