# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Restaurant < ApplicationRecord
  has_many(:reviews, { :class_name => "Review", :foreign_key => "restaurant_id", :dependent => :destroy })

  has_many :foods, through: :reviews
end
