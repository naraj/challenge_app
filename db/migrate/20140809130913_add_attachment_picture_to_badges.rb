class AddAttachmentPictureToBadges < ActiveRecord::Migration
  def change
  	add_attachment :badges, :picture
  end
end
