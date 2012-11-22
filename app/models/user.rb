class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_protected
  # attr_accessible :title, :body
  has_many :goals
  has_many :tomatoes

  def today_tomatoes
   self.tomatoes.where('tomatoes.from BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).where(completed: true).all
    
  end
end
