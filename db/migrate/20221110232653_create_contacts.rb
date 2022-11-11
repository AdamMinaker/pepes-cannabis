class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :title
      t.text :content
      t.string :email
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
