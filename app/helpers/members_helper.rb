module MembersHelper
  def posts_count
    @member = Member.find(params[:id])
    id = @member.id
    Post.where('member_id == ?', id).count
  end
end
