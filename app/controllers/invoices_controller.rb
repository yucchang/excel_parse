class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.order(date: :desc)
    respond_to do |format|
      format.html
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  # def destroy
  #   invoice = Invoice.find(params[:id])
  #   invoice.delete if invoice
  #   redirect_to invoices_path, notice: 'Invoice removed.'
  # end
end
