class Task < ActiveRecord::Base
  attr_protected
  belongs_to :goal
end
