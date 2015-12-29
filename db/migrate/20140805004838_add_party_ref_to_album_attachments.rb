class AddPartyRefToAlbumAttachments < ActiveRecord::Migration
  def change
    add_reference :album_attachments, :party, index: true
  end
end
