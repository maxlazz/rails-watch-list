class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save

    redirect_to lists_path(@list)
  end

  def edit
    # Récupérer la liste qu'on veut modifier
  end

  def update
      @list.update(list_params)

      redirect_to list_path(@list)
  end

  def destroy
    @list.destroy

    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
      params.require(:list).permit(:name, :address, :rating)
  end

  def set_list
      @list = List.find(params[:id])
  end
end
