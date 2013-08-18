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
end
