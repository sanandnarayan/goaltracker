class Tomato < ActiveRecord::Base
  belongs_to :user
  attr_accessible :completed, :duration, :from, :to
  before_save :calculate_duration

  def calculate_duration
    self.duration  = ((self.to - self.from)/60).floor
    self.completed = self.duration > 24
    true
  end
end
