class RoastersController < ApplicationController
    skip_before_action :require_user, only: [:index, :show]
    before_action :set_roaster, only: [:show, :edit, :update]
    before_action :require_admin, only: [:new, :create, :edit, :update]

    def index
        @roasters = Roaster.paginate(page: params[:page], per_page: 12)
    end

    def new
        @roaster = Roaster.new
    end

    def create 
        @roaster = Roaster.new(roaster_params)
        if @roaster.save
          flash[:success] = 'Roaster was successfully created!'
          redirect_to roaster_path(@roaster)
        else
          render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update    
      if @roaster.update(roaster_params)
        flash[:success] = 'Roaster was successfully updated!'
        redirect_to roaster_path(@roaster)
      else
        render 'edit'
      end
    end

    private
        def set_roaster
            @roaster = Roaster.find(params[:id])
        end

        def roaster_params
            params.require(:roaster).permit(:name, :country)
        end
end  