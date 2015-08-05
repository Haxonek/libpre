module ApplicationHelper
  def configure_title(title)
    if title.blank?
      "Libpre"
    else
      title
    end
  end
end
