class InvoicesController < ApplicationController
  before_action :find_invoice, except: [:index]

  def index
    @invoices = Invoice.order(date: :desc)
    respond_to do |format|
      format.html
    end
  end

  def show
  end

  def edit
  end

  def update

    if @invoice.update(invoice_state_params)
      redirect_to invoices_path
    else
      render :new
    end
  end

  # def destroy
  #   invoice.delete if invoice
  #   redirect_to invoices_path, notice: 'Invoice removed.'
  # end

  private
  def find_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_state_params
    params.require(:invoice).permit(:state)
  end
end
