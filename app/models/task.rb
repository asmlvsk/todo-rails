class Task < ApplicationRecord
    has_many :categories

    validates :title, presence: true, length: {minimum: 2}
    validates :body, presence: true, length: {minimum: 3}
end
