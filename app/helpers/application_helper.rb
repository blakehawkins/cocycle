module ApplicationHelper
  # Create a link within a list item with a conditional 'active' class.
  def nav_link(body, path)
    content_tag(:li, class: ('active' if current_page? path)) do
      link_to body, path
    end
  end
end
