class Flat < ActiveRecord::Base
  belongs_to :user

  def self.search(query)
    where("city like ?", "%#{query}%")
  end
end
