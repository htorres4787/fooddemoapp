# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  body          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  food_id       :integer
#  restaurant_id :integer
#  user_id       :integer
#
class Review < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:restaurant, { :required => true, :class_name => "Restaurant", :foreign_key => "restaurant_id" })
  belongs_to(:food, { :required => true, :class_name => "Food", :foreign_key => "food_id" })
end
