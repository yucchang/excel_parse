class ImportInvoice
  include ActiveModel::Model
  require 'roo'

  attr_accessor :file

  def initialize(attributes={})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def load_imported_invoices
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      invoice = Invoice.find_by(PSN: row["PSN"]) || Invoice.new
      invoice.attributes = row.to_hash
      invoice
    end
  end

  def imported_invoices
    @imported_invoices ||= load_imported_invoices
  end

  def save
    if imported_invoices.each(&:valid?).all?
      imported_invoices.each(&:save!)
      byebug
      true
    else
      imported_invoices.each_with_index do |invoice, index|
        invoice.errors.full_messages.each do |msg|
         errors.add(:base, "Row#{index + 2}: #{msg}")
        end
      end
      false
    end
  end
end
