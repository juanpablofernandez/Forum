class Topic < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    validates :description, presence: true
    belongs_to :mainforum
end
