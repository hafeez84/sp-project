class Api::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    json_post(@posts)
  end

  def show
    json_post(@post)
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      json_post(@post, status: 201)
    else
      json_post(@post.errors, status: 422)
      #:unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      # json_post(@post)
      head :no_content
    else
      json_post(@post.errors, status: 422)
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
