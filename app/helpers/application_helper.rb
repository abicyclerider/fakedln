module ApplicationHelper
  def profile_picture_for(user, size: 50)
    if user.profile_picture.attached?
      image_tag user.profile_picture, style: "width: #{size}px; height: #{size}px; border-radius: 50%; object-fit: cover;"
    else
      # Default avatar with initials
      content_tag :div, style: "width: #{size}px; height: #{size}px; border-radius: 50%; background-color: #0073b1; color: white; display: inline-flex; align-items: center; justify-content: center; font-weight: bold;" do
        "#{user.first_name&.first&.upcase}#{user.last_name&.first&.upcase}"
      end
    end
  end
end

