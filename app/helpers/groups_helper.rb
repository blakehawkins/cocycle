module GroupsHelper
  def glyphicon(code, alt = nil)
    content_tag :span, class: "glyphicon glyphicon-#{code.to_s.dasherize}" do
      content_tag(:span, alt.to_s, class: 'sr-only') if alt
    end
  end

  def back_path
    if @group.nil? then root_path
    elsif @group.new_record? || current_page?(@group) then groups_path
    else @group
    end
  end

  def nav_back_link
    link_to 'back', back_path,
            title: 'Go back', class: 'btn btn-default'
  end

  def nav_new_link
    link_to 'new', new_group_path,
            title: 'New group', class: 'btn btn-primary'
  end

  def nav_edit_link
    link_to 'edit', edit_group_path(@group),
            title: 'Edit group', class: 'btn btn-default'
  end

  def nav_delete_link
    link_to 'delete', @group,
            title: 'Delete Group', class: 'btn btn-danger',
            role: 'button', method: :delete,
            data: { confirm: 'Delete this group?' }
  end
end
