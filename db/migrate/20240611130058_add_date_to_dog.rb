class AddDateToDog < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :start_date, :date
    add_column :dogs, :end_date, :date
  end
end
