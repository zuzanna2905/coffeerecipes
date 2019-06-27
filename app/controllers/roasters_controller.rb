class RoastersController < ApplicationController
    skip_before_action :require_user, only: [:index, :show]
    def index
        @roasters = Roaster.paginate(page: params[:page], per_page: 12)
    end

    def show
        @roaster = Roaster.find(params[:id])
    end
end  