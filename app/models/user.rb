class User < ActiveRecord::Base
  has_many :articles
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  VALID_MAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 155},
                    format: { with: VALID_MAIL_REGEX },
                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
end
