class Timelet < ActiveRecord::Base
  belongs_to :task
  attr_accessible :duration, :from, :to
  before_save :calculate_duration

  def calculate_duration
    self.duration = ((self.to - self.from)/60).floor
    print  'before duration is run'
  end
end
