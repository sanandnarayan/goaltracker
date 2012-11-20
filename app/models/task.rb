class Task < ActiveRecord::Base
  attr_accessible :archived, :done, :name, :position, :references
end
