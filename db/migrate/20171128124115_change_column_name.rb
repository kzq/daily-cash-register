class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :weekly_sales, :sales, :sale
  end
end
