class AddAttachmentFileToAlbumAttachments < ActiveRecord::Migration
  def self.up
    change_table :album_attachments do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :album_attachments, :picture
  end
end
