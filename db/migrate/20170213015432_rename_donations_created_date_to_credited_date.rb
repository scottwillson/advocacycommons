class RenameDonationsCreatedDateToCreditedDate < ActiveRecord::Migration[5.0]
  def change
    rename_column :donations, :created_date, :credited_date
  end
end
