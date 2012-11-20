class Goal < ActiveRecord::Base
  attr_accessible :archived, :name, :position, :references
end
