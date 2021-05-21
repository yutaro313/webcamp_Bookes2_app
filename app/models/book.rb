class Book < ApplicationRecord

  belongs_to :user

  validates :book_title, presence: true
  validates :opinion, {presence: true, lengh: {maximum: 200}}
end
