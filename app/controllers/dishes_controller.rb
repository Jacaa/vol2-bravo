class DishesController < ApplicationController
  before_action :authenticate_user!
  def index
    @cook = Cook.find(params[:cook_id])
    if @cook.dishes.present? then
      @cook_dishes = @cook.dishes
    else
      notice.now = 'Kucharz nie ma żadnych dań'
    end
  end

  def new
    @dish = Dish.new
    @cook = Cook.find(params[:cook_id])
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def create
    if current_user.is_cook? then
      @dish = Dish.new(dish_params)
      if @dish.save
        redirect_to cook_dish_path(current_user.cook, @dish)
      else
        render "new"
      end
    else
        not_cook
    end
  end
  def edit
    set_cook_and_dish
  end

  def update
    @dish = set_cook_and_dish
    if @dish.update_attributes(dish_params) then
        redirect_to cook_dish_path(current_user.cook, @dish)
    else
      render "edit"
    end
  end

  def destroy
    set_cook_and_dish.destroy
    flash[:success] = "User deleted"
    redirect_to action: 'index', cook_id: @cook.id
  end

  private

    def dish_params
      if current_user.is_cook? then
        params.require(:dish).permit(:name, :description, :type_of_kitchen, :spicyness).merge(cook_id: current_user.cook.id)
      end
    end

    def not_cook
      redirect_to root_path , notice: 'Nie jesteś kucharzem, nie możesz tworzyć dań!'
    end

    def set_cook_and_dish
      @cook = current_user.cook
      @dish = Dish.find(params[:id])
    end
end