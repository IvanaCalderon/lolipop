class User < ApplicationRecord
  # belongs_to :position

  has_one :candidate, dependent: :destroy
  # has_one :department, through: :position
  # has_many :trainings, dependent: :destroy
  # has_many :job_experiences, dependent: :destroy
  # has_and_belongs_to_many :competencies
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
