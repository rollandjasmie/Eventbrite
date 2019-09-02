class CreateAttandances < ActiveRecord::Migration[5.2]
  def change
    create_table :attandances do |t|
      t.string :stripe_customer_id
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true

      t.timestamps
    end
  end
end
