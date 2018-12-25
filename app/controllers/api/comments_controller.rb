class Api::CommentsController < ApplicationController
  before_action :set_post
  before_action :set_post_comment, only: [:show, :update, :destroy]

  # GET /api/posts/:post_id/comments
  def index
    json_comment(@post.comments)
  end

  # GET /api/posts/:post_id/comments/:id
  def show
    json_comment(@post)
  end

  # POST /api/posts/:post_id/comments
  def create
    @post.comments.create!(comment_params)
    json_comment(@post, :created)
  end

  # PUT /api/posts/:post_id/comments/:id
  def update
    @post.update(comment_params)
    head :no_content
  end

  # DELETE /api/posts/:post_id/comments/:id
  def destroy
    @post.destroy
    head :no_content
  end

  private

  def comment_params
    params.permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_post_comment
    @post = @post.comments.find_by!(id: params[:id]) if @post
  end
end
