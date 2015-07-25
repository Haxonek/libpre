class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
    @posts = Post.all.order("created_at DESC")
    @post = Post.new
  end

  def create
    params[:post][:ip_address] = request.remote_ip
    # params[:post][:ip_address] = request.ip
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Your post was successfully created"
      redirect_to @post
    else
      flash[:failure] = "There was an error saving your post"
      render 'index'
    end
  end

  def show
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {no_intra_emphasis: true, highlight: true, underline: true, autolink: true, filter_html: true})
    @post.increment!(:hits, by = 1)
    # @post.update_attribute(:hits, @post.hits + 1)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :organization, :tags, :nsfw, :hits, :ip_address, post_items_attributes: [:id, :description, :image_title, :_destroy])
  end
end
