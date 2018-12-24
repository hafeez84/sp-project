class Api::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    json_response(@posts)
  end

  def show
    json_response(@post)
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      json_response(@post)
    else
      json_response(@post.errors, status: :unprocessable_entity)
    end
  end

  def update
    if @post.update(post_params)
      json_response(@post)
    else
      json_response(@post.errors, status: :unprocessable_entity)
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.permit(:title, :des, :picture)
    end
end
