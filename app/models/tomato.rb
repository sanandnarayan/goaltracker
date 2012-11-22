class Tomato < ActiveRecord::Base
  belongs_to :user
  attr_protected
  before_save :calculate_duration

  def calculate_duration
    unless self.to.nil?
      self.duration  = ((self.to - self.from)/60).floor
      self.completed = self.duration > 24
    end
    true
  end
end
