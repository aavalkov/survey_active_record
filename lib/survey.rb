class Survey < ActiveRecord::Base
  validates :title, :presence => true

  has_many :questions
  belongs_to :response
end
