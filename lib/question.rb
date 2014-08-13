class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices
  belongs_to :response
end
