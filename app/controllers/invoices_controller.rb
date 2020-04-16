class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
    respond_to do |format|
      format.html
    end
  end
end
