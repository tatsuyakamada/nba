module SessionsHelper

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

end
