class CreateAlbumAttachments < ActiveRecord::Migration
  def change
    create_table :album_attachments do |t|
      t.string :access_token

      t.timestamps
    end
  end
end
