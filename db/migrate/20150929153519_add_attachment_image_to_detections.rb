class AddAttachmentImageToDetections < ActiveRecord::Migration
  def self.up
    change_table :detections do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :detections, :image
  end
end
