class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :device

  attr_accessor :start_at_time, :start_at_date, :end_at_time, :end_at_date

  def initialize(options={})
    super(options)
    # debugger
    self.start_at = Time.zone.parse("#{start_at_date} #{start_at_time}") if start_at_date && start_at_time
    self.end_at = Time.zone.parse("#{end_at_date} #{end_at_time}") if end_at_date && end_at_time
  end


  ## TODO: validations
  validates :user_id, :presence => true

end
