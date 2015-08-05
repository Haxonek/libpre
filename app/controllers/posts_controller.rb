class PostsController < ApplicationController
  before_action :find_post, only: [:show]
  include PostsHelper

  def index
    @post = Post.new
    @posts = Post.all.where(nsfw: false, ip_address: request.remote_ip).order("created_at DESC").first(12)
    # @posts = Post.all.order("created_at DESC").first(12) # to print everything
  end

  def create
    ip = request.remote_ip.to_s
    unless ip.length <= 7 || ip.length >= 15
      params[:post][:ip_address] = ip
    end

    params[:post][:id] = generate_id

    @post = Post.new(post_params)
    if @post.save && verify_recaptcha
      flash[:success] = "Your post was successfully created.  We recomend saving the url to this page so it can be referenced later; your image(s) may be deleted after six months of not being viewed."
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
    params.require(:post).permit(:id, :title, :organization, :nsfw, :hits,
                :ip_address, post_items_attributes: [:id, :image_title,
                :image, :description, :_destroy])
  end
end
