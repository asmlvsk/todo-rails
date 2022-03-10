class SessionsController < ApplicationController
    include CurrentUserConcern

    def create
        user = User.find_by(email: params["user"]["email"]).try(:authenticate, params["user"]["password"])
        avatar = rails_blob_url(user.avatar)

        if user
            session[:user_id] = user.id
            render json: {
                status: :created,
                logged_in: true,
                user: user,
                avatar: avatar
            }
        else
            render json: { status: 401 }
        end
    end

    def update
        if @current_user.update(avatar: params[:avatar])
            avatar_url = rails_blob_path(@current_user.avatar)
            render json: {avatar_url: avatar_url}, status: :ok
        else
            render json: {status: :unprocessable_entity}
        end
    end

    def logged_in
        avatar = rails_blob_url(@current_user.avatar)
        if @current_user
            render json: {
                logged_in: true,
                user: @current_user,
                avatar: avatar
            }
        else
            render json: {
                logged_in: false
            }
        end
    end

    def logout
        reset_session
        render json: { status: 200, logged_out: true }
    end


    private

    def user_params
        params.require(:session).permit(:avatar)
    end
    
end