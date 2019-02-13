class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :stripe_customer_id
      t.integer :event_id
      t.belongs_to :attendant, index:true
    

      t.timestamps
    end
  end
end
