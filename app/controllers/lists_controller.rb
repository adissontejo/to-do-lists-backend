# frozen_string_literal: true

# Lists CRUD Controller
class ListsController < ApplicationController
  before_action :set_list, only: %i[show update destroy]

  # GET /lists
  def index
    render json: List.all
  end

  # GET /lists/:id
  def show
    render json: @list
  end

  # POST /lists
  def create
    @list = List.new list_params

    if @list.save
      render json: @list
    else
      render json: @list.errors, status: :bad_request
    end
  end

  # PUT /lists/:id
  def update
    if @list.update list_params
      render json: @list
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
    params.require(:list).permit(:title, :description)
  end

  def set_list
    @list = List.find params[:id]
  end
end
