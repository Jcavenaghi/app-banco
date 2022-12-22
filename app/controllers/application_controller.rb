class ApplicationController < ActionController::Base
    include Pundit
    before_action :authenticate_user!

    def access_denied(exception)
        redirect_to new_admin_user_session_path, alert: exception.message
    end
end
