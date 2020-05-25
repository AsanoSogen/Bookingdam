class SignupUsersController < ApplicationController
    before_action :save_step1_to_session, only: :step2

    def step1
        @user = User.new
        @user.build_address
    end
    
      
    
    def save_step1_to_session
        session[:user_params] = user_params
        @user = User.new(session[:user_params])
        render step1_signup_users_path unless @user.valid?
        # binding.pry
    end 

    def step2 
        @user = User.new
        @user.build_address
        # binding.pry
    end

    def create
        # binding.pry
        @user = User.new(session[:user_params])  # ここでuserモデルのsessionを引数で渡す。
        @user.build_address(session[:address_attributes_after_step1])
        @user.build_address(user_params[:address_attributes])  # 今回のビューで入力された情報を代入。
        if @user.valid?
            session[:id] = @user.id  #ここでidをsessionに入れることでログイン状態に持っていく。
            redirect_to complete_signup_users_path
        else
            render step2_signup_users_path
        end
    end

    def complete
        sign_in User.find(session[:id]) unless user_signed_in?
    end

    private
    def user_params
        params.require(:user).permit(
            :nickname,
            :email,
            :password, 
            :password_confirmation,
            address_attributes: [:id, :phone_number, :postal_code, :prefectures, :municipalities, :address, :building]
        )
    end
    
end
