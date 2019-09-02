class CreateUserProfils < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profils do |t|

      t.timestamps
    end
  end
end
