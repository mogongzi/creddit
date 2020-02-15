class VotesController < ApplicationController

  def create
    post_id = params[:post_id]
    vote = Vote.new(post_id: post_id, upvote: params[:upvote], account_id: current_account.id)
    existing_vote = Vote.where(account_id: current_account.id, post_id: post_id)
    @new_vote = existing_vote.empty?
    respond_to do |format|
      format.js {
        existing_vote.empty? ? @success = vote.save : existing_vote.first.destroy
        @post = Post.find(post_id)
        @is_upvote = params[:upvote]
        render 'votes/create'
      }
    end
  end
end
