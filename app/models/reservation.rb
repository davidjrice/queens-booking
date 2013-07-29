class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :device

  attr_accessor :start_at_time, :start_at_date, :end_at_time, :end_at_date

  ## TODO: validations
  validates :user_id, :presence => true
  

  validate :must_not_be_in_the_past

  def must_not_be_in_the_past
    errors.add(:base, 'Reservation must not be in the past.') if self.start_at < Time.zone.now
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
errors.add(:base, 'Must choose a device.') if self.device_id = nil
 end



  

end
