class AddPhotoUrlToRailers < ActiveRecord::Migration
  def self.up
    add_column :railers, :photo_url, :string
  end

  def self.down
    remove_column :railers, :photo_url
  end
end
