class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
    respond_to do |format|
      format.html
    end
  end

  def destroy
    invoice = Invoice.find(params[:id])
    invoice.delete if invoice
    redirect_to invoices_path, notice: 'Invoice removed.'
  end
end
