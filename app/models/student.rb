class Student < ApplicationRecord
  belongs_to :instructor

  validates :name, presence: true
  validates_numericality_of :age, greater_than: 17
end
