class ImportInvoicesController < ApplicationController
  def new
    @import_invoice = ImportInvoice.new
  end

  def create
    @import_invoice = ImportInvoice.new(params[:import_invoice])
    if @import_invoice.save
      redirect_to invoices_path
    else
      render :new
    end
  end
end
