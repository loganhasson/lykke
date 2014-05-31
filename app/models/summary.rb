class Summary < ActiveRecord::Base
  belongs_to :user
  belongs_to :day
  has_one    :rating
end
