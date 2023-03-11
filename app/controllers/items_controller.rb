# frozen_string_literal: true

# Items API Controller
class ItemsController < ApplicationController
  before_action :ensure_authenticated
  before_action :set_list
  before_action :set_item, only: %i[show update check uncheck destroy]

  # GET /lists/:list_id/items
  def index
    render json: @list.items.all, each_serializer: ItemSerializer::Default
  end

  # GET /lists/:list_id/items/:id
  def show
    render json: @item, serializer: ItemSerializer::WithList
  end

  # POST /lists/:list_id/items
  def create
    params = item_params
    params[:checked] = false

    @item = @list.items.new params

    if @item.save
      render json: @item, serializer: ItemSerializer::Default
    else
      render json: @item.errors, status: :bad_request
    end
  end

  # PUT /lists/:lists_id/items/:id
  def update
    if @item.update item_params
      render json: @item, serializer: ItemSerializer::Default
    else
      render json: @item.errors, status: :bad_request
    end
  end

  # PUT /lists/:lists_id/items/:id/check
  def check
    if @item.update checked: true
      render json: @item, serializer: ItemSerializer::Default
    else
      render json: @item.errors, status: bad_request
    end
  end

  # PUT /lists/:lists_id/items/:id/uncheck
  def uncheck
    if @item.update checked: false
      render json: @item, serializer: ItemSerializer::Default
    else
      render json: @item.errors, status: bad_request
    end
  end

  # DELETE /lists/:lists_id/items/:id
  def destroy
    @item.destroy
  end

  private

  def item_params
    params.permit(:description)
  end

  def set_list
    @list = @current_user.lists.find params[:list_id]
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.to_s }, status: :not_found
  end

  def set_item
    @item = @list.items.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.to_s }, status: :not_found
  end
end
