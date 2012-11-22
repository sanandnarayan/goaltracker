class Timelet < ActiveRecord::Base
  belongs_to :task
  before_save :calculate_duration
  attr_protected

  def calculate_duration
    self.duration = ((self.to - self.from)/60).floor unless self.to.nil?
  end
end
