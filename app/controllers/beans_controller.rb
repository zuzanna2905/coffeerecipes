class BeansController < ApplicationController
    before_action :set_bean, only:  [:show, :edit, :update]

    def index
      @beans = Bean.all
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