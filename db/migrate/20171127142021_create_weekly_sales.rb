class CreateWeeklySales < ActiveRecord::Migration[5.2]
  def change
    create_table :weekly_sales do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :sales
      t.decimal :rent
      t.decimal :cost
      t.decimal :gross_profit
      t.decimal :net_profit

      t.timestamps
    end

    add_index :weekly_sales, :sales
    add_index :weekly_sales, :rent
    add_index :weekly_sales, :cost
    add_index :weekly_sales, :gross_profit
    add_index :weekly_sales, :net_profit
  end
end
