class RoastersController < ApplicationController
    def index
        @roasters = Roaster.paginate(page: params[:page], per_page: 5)
    end
end  