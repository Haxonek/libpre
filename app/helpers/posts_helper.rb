module PostsHelper
  def create_view
    # Seems like the best way to do this but idk why it won't work
    # it's been edited a bit, need to figure out how to pass through @post
    # View.create(organization: org, post_id: ref, viewed_at: Time.now, ip_address: request.remote_ip)
    time = Time.now
    ip = request.ip_address.to_s

    if time.valid? && organization.valid?
      params[:view][:viewed_at] = time
      params[:view][:ip_address] = ip
      params[:view][:organization] = "TEST ORG"
      view = View.create(params.require(:view).permit(:viewed_at, :ip_address, :organization, :post_id))
    end
  end

  private

  def params
    params.require(:view).permit(:viewed_at, :ip_address, :organization, :post_id)
  end
end
