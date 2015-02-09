module Spree
  module Api
    UsersController.class_eval do
      
      def sign_in
        @user = Spree::User.find_for_database_authentication(:email => params[:email])
        if @user.spree_api_key == nil
          @user.generate_spree_api_key!
        end

        if @user == nil
          unauthorized unless @user
          return
        end
        unauthorized unless @user.valid_password?(params[:password])
      end
      
      def reset_password
        @user = User.find_by_email(params[:email])
        if @user.present?
          @user.send_reset_password_instructions
          render :text => "done"
        else
          render :text => "no such email"
        end      
      end

    end
  end
end