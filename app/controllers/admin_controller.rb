class AdminController < ApplicationController
    before_action(:admin_chk)
    
    def user
        @users = User.all
    end
    
    def change
        user = User.find(params[:id])
        
        if user.is_admin?
            user.update(
                is_admin?: false
                )
        else
            user.update(
                is_admin?: true
                )
        end
        redirect_to admin_users_path
    end
    
    private
    def admin_chk
        unless current_user.is_admin?
            flash[:alert] = "님은 관리자가 아니라 접근 못함"
            redirect_to root_path
        end
    end
end
