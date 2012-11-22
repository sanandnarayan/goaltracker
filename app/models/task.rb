class Task < ActiveRecord::Base
  attr_protected
  belongs_to :goal
  has_many :timelets
end
