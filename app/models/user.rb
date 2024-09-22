class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { candidate: 0, hr: 1 }    
  
  def hr?
    role == "hr"
  end

  def candidate?
    role == "candidate"
  end
end
