class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
    @posts = Post.all.where(nsfw: false).order("created_at DESC").first(12)
    # @posts = Post.all.order("created_at DESC") # to print everything
    @post = Post.new
  end

  def create
    ip = request.remote_ip.to_s
    unless ip.length <= 7 || ip.length >= 15
      params[:post][:ip_address] = ip
    end

    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your post was successfully created.  We recomend saving the url to this page so it can be referenced later; although we make guesses at your images we cannot garentee your image will appear and all nsfw will not.  Images may be deleted after six months of not being viewed."
      redirect_to @post
    else
      flash[:failure] = "There was an error saving your post"
      render 'index'
    end
  end

  def show
    renderer =  Redcarpet::Render::HTML.new(filter_html: true, no_images: true,
                prettify: true)
    @markdown = Redcarpet::Markdown.new(renderer, extensions =
                {no_intra_emphasis: true, highlight: true, underline: true,
                autolink: true})

    @post.increment!(:hits, by = 1)
    View.create(organization: @post.organization, post_id: @post.id,
                viewed_at: Time.now, ip_address: request.remote_ip)
    # create_view # I want to use an external method though :/
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :organization, :nsfw, :hits,
                :ip_address, post_items_attributes: [:id, :image_title,
                :image, :description, :_destroy])
  end
end
