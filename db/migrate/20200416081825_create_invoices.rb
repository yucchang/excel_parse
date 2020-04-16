class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :customer
      t.string :invoice_no
      t.datetime :date

      t.timestamps
    end
  end
end
