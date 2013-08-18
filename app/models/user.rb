class User < ActiveRecord::Base

  has_many :reservations
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  def timeout_in
    5.hours
  end

  def self.valid_user_types
    [:admin, :staff, :student]
  end

  def user_type?(type)
    type = type.to_sym
    self.class.valid_user_types.include?(type) && self.user_type.downcase.to_sym == type
  end

end
