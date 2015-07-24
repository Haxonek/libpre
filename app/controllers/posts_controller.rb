class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
    @posts = Post.all.order("created_at DESC")
    @post = Post.new
  end

  def create
    params[:post][:ip_address] = request.remote_ip
    # params[:post][:ip_address] = request.ip
    # not working but am moving on
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Your post was successfully created"
      redirect_to @post
    else
      flash[:failure] = "There was an error saving your post"
      render 'index'
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :organization, :tags, :nsfw, :hits, :ip_address, post_items_attributes: [:id, :description, :_destroy])
  end
end
