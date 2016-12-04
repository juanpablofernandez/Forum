class Mainforum < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    validates :description, presence: true
    has_many :topics
end
