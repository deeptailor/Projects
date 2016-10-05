# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :string           not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#

class Cat < ActiveRecord::Base

  @colors = [
    "brown",
    "white",
    "black",
    "grey"
  ]

  validates :birth_date, presence:true
  validates :color, presence:true, inclusion: { in: %w(brown white black grey),
      message: "%{value} is not #{@colors}" }
  validates :name, presence:true, uniqueness: true
  validates :sex, presence:true, inclusion: { in: %w(m f),
      message: "%{value} is not m or f" }
  validates :description, presence:true


  has_many :rental_requests,
  dependent: :destroy,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :Cat

  # def validate_colors
  #
  # end
end
