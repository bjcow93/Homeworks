class Band < ApplicationRecord
  validates :band, presence: true, uniqueness: true


end
