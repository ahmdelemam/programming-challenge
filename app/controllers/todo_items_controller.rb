class TodoItemsController < ApplicationController

  before_action :set_todo_item, only: [:show, :update, :destroy]

  def index
    @todo_items = TodoItem.paginate(pagination_params)
    render json: @todo_items, status: :ok
  end

  def show
    render json: @todo_item, status: :ok
  end

  def create
    @todo_item = TodoItem.create!(todo_items_params)
    render json: @todo_item, status: :created
  end

  def update
    @todo_item.update(todo_items_params)
    head :no_content
  end

  def destroy
    @todo_item.destroy
    head :no_content
  end

  private

  def todo_items_params
    params.permit(:title, :read)
  end

  def set_todo_item
    @todo_item = TodoItem.find(params[:id])
  end
end
