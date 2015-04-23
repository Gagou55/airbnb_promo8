module UsersHelper
  def picture_if_exists(user)
      if @user.picture.exists?
        image_tag user.picture.url(:thumb)
      end
    end
end
