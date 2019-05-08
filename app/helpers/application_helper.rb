module ApplicationHelper

  def full_name
    @member.last_name + " " + @member.first_name
  end

  def full_name_call
    @member.last_name_call + " " + @member.first_name_call
  end

  def current_member
    @current_member ||= Member.find_by(id: session[:member_id])
  end

end
