class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :password_digest, null: false
      t.string :session_token, unique: true

      t.timestamps 

    end

    add_index :users, :session_token

  end
end
