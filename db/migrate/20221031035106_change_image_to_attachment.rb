class ChangeImageToAttachment < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :image, :attachment
  end
end
