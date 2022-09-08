class NewsLetter < ApplicationRecord
  self.table_name = "news_letter"

  has_many :news_letter_recipients
  has_one_attached :file
end
