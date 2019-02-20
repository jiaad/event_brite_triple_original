class AddValidateLogicToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :admin_validation, :boolean
  end
end
