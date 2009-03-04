class CreateRailers < ActiveRecord::Migration
  def self.up
    create_table :railers do |t|
      t.string :name
      t.string :url
      t.string :city
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :railers
  end
end
