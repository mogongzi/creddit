module VotesHelper
  def upvoted? post
    account_signed_in? && current_account.upvoted_post_ids.include?(post.id) ? ' active' : ''
  end

  def downvoted? post
    account_signed_in? && current_account.downvoted_post_ids.include?(post.id) ? ' active' : ''
  end
end
