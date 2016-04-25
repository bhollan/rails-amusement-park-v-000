class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides

  def show_string(user)
    if user.admin
      "Show #{self.name}"
    else
      "Go on #{self.name}"
    end
  end
end
