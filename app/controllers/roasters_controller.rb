class RoastersController < ApplicationController
    skip_before_action :require_user, only: [:index, :show]
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
        @roaster = Roaster.find(params[:id])
    end

    private
        def roaster_params
            params.require(:roaster).permit(:name, :country)
        end
end  