class Post < ApplicationRecord
  has_many :comments
  belongs_to :category, optional:true
  belongs_to :user, optional: true

  validates(:title, { presence: true })
  validates(:body, { presence: true, length: { minimum: 10 } })
end
