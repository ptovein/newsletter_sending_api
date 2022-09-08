class Recipients < ApplicationRecord
  self.table_name = "recipients"

  has_many :news_letter_recipients
end
