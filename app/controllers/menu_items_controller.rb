class MenuItemsController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_menu_item, only: [:edit, :destroy, :update]

  def new
    @menu_item = MenuItem.new(parent_id: params[:parent_id], position: params[:position])
    render 'edit'
  end
  
  def create
    @menu_item = MenuItem.create(menu_item_params)
    render 'update'
  end

  def destroy
    @menu_item.destroy
  end

  def update
    @menu_item.update(menu_item_params)
  end

  private
  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params[:menu_item].permit(:parent_id, :priority, :text, :url, :position)
  end

end