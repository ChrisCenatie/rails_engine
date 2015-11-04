class Api::V1::ItemsController < ApplicationController

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find
    respond_with Item.find_by(item_params)
  end

  def find_all
    respond_with Item.where(item_params)
  end

  def random
    respond_with Item.all.sample
  end

  private

    def item_params
      serialize_unit_price
      params.permit(:id, :name, :description, :unit_price, :merchant_id,
                    :created_at, :updated_at)
    end

    def serialize_unit_price
      if params[:unit_price]
        params[:unit_price] = params[:unit_price].sub('.','')
      end
    end
end
