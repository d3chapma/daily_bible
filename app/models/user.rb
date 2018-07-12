class User < ApplicationRecord
  has_many :plans, dependent: :destroy
end
