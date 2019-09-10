class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_member, :admin_member

    def log_in(member)
      session[:member_id] = member.id
    end

    def current_member
      @current_member ||= Member.find_by(id: session[:member_id])
    end

    def logged_in?
      !current_member.nil?
    end

    def log_out
      session.delete(:member_id)
      @current_member == nil
    end

    def admin_member
      current_member&.administrator?
    end
end
