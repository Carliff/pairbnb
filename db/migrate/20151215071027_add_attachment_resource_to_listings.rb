class AddAttachmentResourceToListings < ActiveRecord::Migration
  def self.up
    change_table :listings do |t|
      t.attachment :resource
    end
  end

  def self.down
    remove_attachment :listings, :resource
  end
end
