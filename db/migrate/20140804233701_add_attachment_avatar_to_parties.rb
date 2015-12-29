class AddAttachmentAvatarToParties < ActiveRecord::Migration
  def self.up
    change_table :parties do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :parties, :avatar
  end
end
