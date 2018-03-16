class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :collage
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :login

  def login=(login)
    @login = login
  end

  def login
    @login || self.firstname || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(firstname) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:firstname) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
  end

  def full_name
    self.firstname+self.lastname
  end
end
