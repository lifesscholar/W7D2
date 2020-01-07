class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(
            params[:user],
            params[:password]
        )
        
        if user.nil?
            flash.now[:errors] = ["Please specify correct email and password"]
            render :new
        else
            login!(user)
            redirect_to user_url
        end
    end
end
