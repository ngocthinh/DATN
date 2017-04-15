class Technique < ApplicationRecord
  has_many :target_techniques, dependent: :destroy
  belongs_to :category
end
