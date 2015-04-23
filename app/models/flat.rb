class Flat < ActiveRecord::Base
  belongs_to :user


  has_attached_file :picture,
    styles: { medium: "400x400>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
