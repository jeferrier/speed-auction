class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

      t.belongs_to :user, index: true
      t.string :name
      t.text :description
      t.float :starting_price
      t.float :buyout_price
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :delivered

      t.timestamps
    end

    add_attachment :items, :headline_image

  end
end
