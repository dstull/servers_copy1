class Host < ApplicationRecord
  validates :name, uniqueness: true
end
