class ChangeInvoiceStateColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :invoices, :state, :string, :index =>true, :default =>'open'

    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE TYPE invoice_state AS ENUM ('open', 'pending', 'closed');
        SQL
      end

      dir.down do |dir|
        execute <<-SQL
          DROP TYPE invoice_state
        SQL
      end
    end
  end
end
