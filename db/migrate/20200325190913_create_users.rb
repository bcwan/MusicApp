class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email, null: false, unique: true
      t.text :password_digest, null: false
      t.text :session_token, null: false, unique: true
      t.timestamps
    end
    add_index(:users, :email)
    add_index(:users, :session_token)
  end
end
