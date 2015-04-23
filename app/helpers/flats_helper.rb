module FlatsHelper

    def picture_if_exists(flat)
      if flat.picture.exists?
        image_tag flat.picture.url(:thumb)
      end
    end
end
