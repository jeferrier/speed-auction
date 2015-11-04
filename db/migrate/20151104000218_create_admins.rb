class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :password_digest
      t.timestamp :session_expires
      t.string :session_id

      t.timestamps
    end
  end
end
