# frozen_string_literal: true

# Lists API Controller
class ListsController < ApplicationController
  before_action :ensure_authenticated
  before_action :set_list, only: %i[show update destroy]

  # GET /lists
  def index
    render json: @current_user.lists.all, each_serializer: ListSerializer::Default
  end

  # GET /lists/:id
  def show
    render json: @list, serializer: ListSerializer::WithItems
  end

  # POST /lists
  def create
    @list = @current_user.lists.new list_params

    if @list.save
      render json: @list, serializer: ListSerializer::Default
    else
      render json: @list.errors, status: :bad_request
    end
  end

  # PUT /lists/:id
  def update
    if @list.update list_params
      render json: @list, serializer: ListSerializer::Default
    else
      render json: @list.errors, status: :bad_request
    end
  end

  # DELETE /lists/:id
  def destroy
    @list.destroy
  end

  private

  def list_params
    params.permit(:title, :description)
  end

  def set_list
    @list = @current_user.lists.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.to_s }, status: :not_found
  end
end
