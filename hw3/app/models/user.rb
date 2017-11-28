class User < ApplicationRecord

  has_many :urls

  validates :password, presence: true

end
