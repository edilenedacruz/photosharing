class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :slug
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :avatar_url
      t.string :password_digest
      t.string :token
      t.string :provider
      t.string :uid
      t.string :token_expiration
      t.integer :role, default: 0
      

      t.timestamps null: false
    end
  end
end
