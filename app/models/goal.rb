class Goal < ActiveRecord::Base
  attr_protected
  belongs_to :user
  has_many :tasks
end
