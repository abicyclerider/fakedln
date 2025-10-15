class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { minimum: 1, maximum: 5000 }
end
