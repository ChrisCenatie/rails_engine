class Api::V1::InvoiceItemsController < ApplicationController

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def find
    respond_with InvoiceItem.find_by(invoice_item_params)
  end

  def find_all
    respond_with InvoiceItem.where(invoice_item_params)
  end

  def random
    respond_with InvoiceItem.all.sample
  end

  def invoice
    respond_with InvoiceItem.find(params[:id]).invoice
  end

  def item
    respond_with InvoiceItem.find(params[:id]).item
  end

  private

    def invoice_item_params
      serialize_unit_price
      params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price,
                    :created_at, :updated_at)
    end

    def serialize_unit_price
      if params[:unit_price]
        params[:unit_price] = params[:unit_price].sub('.','')
      end
    end

end
