class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def new
    @post = Post.new
  end

  def create
    params[:post][:ip_address] = request.ip
    # params[:post][:ip_address] = request.remote_ip
    # not working but am moving on
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = "Your post was successfully created"
      redirect_to @post
    else
      flash[:failure] = "There was an error saving your post"
      render 'new'
    end
  end

  def show
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :organization, :tags, :nsfw, :hits, :ip_address)
  end
end
