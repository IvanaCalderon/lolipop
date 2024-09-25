class Candidate < ApplicationRecord
  belongs_to :user
  belongs_to :position
  belongs_to :department
end
