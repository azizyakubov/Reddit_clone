module DiscussionsHelper

  # helper to be user in views to check to see if current user is also the author
  def discussion_author(discussion)
    user_signed_in? && current_user.id == discussion.user_id
  end

  def reply_author(reply)
    user_signed_in? && current_user.id == reply.user_id
  end
end
