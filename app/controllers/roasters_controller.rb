class RoastersController < ApplicationController
    skip_before_action :require_user, only: [:index, :show]
    def index
        @roasters = Roaster.paginate(page: params[:page], per_page: 5)
    end
end  