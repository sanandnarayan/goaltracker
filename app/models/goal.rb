class Goal < ActiveRecord::Base
  attr_protected
  belongs_to :user
  has_many :tasks
  has_many :timelets, through: :tasks
end
