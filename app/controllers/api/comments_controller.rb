class Api::CommentsController < ApplicationController
  before_action :set_post
  before_action :set_post_comment, only: [:show, :update, :destroy]

  # GET /todos/:todo_id/items
  def index
    json_response(@post.comments)
  end

  # GET /todos/:todo_id/items/:id
  def show
    json_response(@post)
  end

  # POST /todos/:todo_id/items
  def create
    @post.comments.create!(comment_params)
    json_response(@post, :created)
  end

  # PUT /todos/:todo_id/items/:id
  def update
    @post.update(comment_params)
    head :no_content
  end

  # DELETE /todos/:todo_id/items/:id
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
