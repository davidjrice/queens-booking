class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :device

  attr_accessor :start_at_time, :start_at_date, :end_at_time, :end_at_date

  ## TODO: validations
  validates :user_id, :presence => true
  
  scope :overlapping, lambda { |interval|
    where("(DATEDIFF(start_at, ?) * DATEDIFF(?, end_at)) >= 0", interval.end_at, interval.start_at)
  }
  scope :for_device, lambda { |device_id|
    where(:device_id => device_id)
  }

  validate :overlapcheck
  def overlapcheck
    if self.class.for_device(self.device_id).overlapping(self).size > 0
      errors.add(:base, 'Reservation overlaps')
    end
  end

  validate :must_not_be_in_the_past

  def must_not_be_in_the_past
    errors.add(:base, 'Reservation must not be in the past.') if self.start_at+1.minute < Time.zone.now
  end

  def cancel!
    self.update_columns :cancelled => true
  end


  def initialize(options={})
    super(options)
    self.start_at = Time.zone.parse("#{start_at_date} #{start_at_time}") if start_at_date && start_at_time
    self.end_at = Time.zone.parse("#{end_at_date} #{end_at_time}") if end_at_date && end_at_time
  end

validate :must_choose_device

def must_choose_device
  errors.add(:base, 'Must choose a device.') if !self.device_id 
end

validate :must_be_on_one_day

def must_be_on_one_day
  errors.add(:base, 'Reservations must start and end on the same day') if start_at_date != end_at_date
end

validate :reservations_maximum_length

def reservations_maximum_length
  errors.add(:base, 'Reservations can have a duration of four hours maximum.') if (end_at_time.to_i - start_at_time.to_i) > 4.hours
end 


validates :start_at_time, :timeliness => {:between => ['9:00am', '5:00pm']}

validates :end_at_time, :timeliness => {:between => ['9:00am', '5:00pm']}
  
end
