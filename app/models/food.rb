# == Schema Information
#
# Table name: foods
#
#  id         :integer          not null, primary key
#  name       :string
#  opinion    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Food < ApplicationRecord

  has_many(:reviews, { :class_name => "Review", :foreign_key => "food_id", :dependent => :destroy })

  has_many :restaurant, through: :reviews
end
