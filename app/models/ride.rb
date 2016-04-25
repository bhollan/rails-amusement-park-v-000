class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def take_ride
    if (self.not_enough_tickets? && self.not_tall_enough?)
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif(self.not_enough_tickets?)
      "Sorry. You do not have enough tickets the #{self.attraction.name}."
    elsif(self.not_tall_enough?)
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      self.user.update(tickets: self.user.tickets - self.attraction.tickets)
      self.user.update(nausea: self.user.nausea + self.attraction.nausea_rating)
      self.user.update(happiness: self.user.happiness + self.attraction.happiness_rating)
    end
  end

  def not_enough_tickets?
    self.attraction.tickets > self.user.tickets
  end

  def not_tall_enough?
    self.attraction.min_height > self.user.height
  end

end
