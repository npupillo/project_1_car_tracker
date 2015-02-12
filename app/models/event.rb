class Event < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :vendor
  belongs_to :category

  #return if overdue or not
  def overdue?
    if self.due_date.past? && self.event_date.future?
      return 'YES'
    else
      return 'NO'
    end
  end

  #return if the event is a future event or not
  def future_event
    if self.due_date.future? && self.event_date.future?
      return 'YES'
    else
      return 'NO'
    end
  end

  validates :name, presence: true
end

