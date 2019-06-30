class BeansController < ApplicationController
  skip_before_action :require_user, only: [:index, :show]
  before_action :set_bean, only: [:show, :edit, :update]
  before_action :require_admin, only: [:edit, :update, :destroy]

  def index
    @beans = Bean.paginate(page: params[:page], per_page: 6)
  end

  def new
    @bean = Bean.new
  end

  def edit
  end
  
  def update
    if @bean.update(bean_params)
      flash[:success] = 'Bean was successfully updated!'
      redirect_to bean_path(@bean)
    else
      render 'edit'
    end
  end

  def create
    @bean = Bean.new(bean_params)
    @bean.roaster = Roaster.find(params[:roaster].to_i + 1)
    if @bean.save
      flash[:success] = 'Bean was successfully created!'
      redirect_to bean_path(@bean)
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @bean.destroy
    flash[:danger] = 'Bean was successfully destroyed!'
    redirect_to beans_path
  end

  private
  def bean_params
    params.require(:bean).permit(:name, :country, :method, :description, :roast)
  end

  def set_bean
    @bean = Bean.find(params[:id])
  end

end