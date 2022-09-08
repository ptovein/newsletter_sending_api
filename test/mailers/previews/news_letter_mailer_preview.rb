# Preview all emails at http://localhost:3000/rails/mailers/news_letter_mailer
class NewsLetterMailerPreview < ActionMailer::Preview
  def first_email
    NewsLetterMailer.first_email
  end
end
