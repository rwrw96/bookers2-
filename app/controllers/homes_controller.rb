class HomesController < ApplicationController
    before_action :move_to_signed_in, except: [:top,:about]
    
    def top
    end
    
    def about
    end
    
    # def sign_up
    #     @user = User.new
    #     redirect_to user_path(@user.id)
    # end
end
