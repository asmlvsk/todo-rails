class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_secure_password
    has_one_attached :avatar
    has_many :tasks, dependent: :destroy
    validates :name, presence: true, length: {minimum: 2}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {minimum: 2}, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
end
