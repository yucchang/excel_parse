class AddColumnToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :customer_code, :string
    add_column :invoices, :address, :string
    add_column :invoices, :PSN, :string
    add_column :invoices, :pieces, :integer
    add_column :invoices, :controlled, :boolean, null: false, default: false
    add_column :invoices, :temp_sensitive, :boolean, null: false, default: false
    add_column :invoices, :state, :string
  end
end
