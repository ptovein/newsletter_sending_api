class NewsLetterMailer < ApplicationMailer
  default from: ""

  include Rails.application.routes.url_helpers

  def welcome_email
    puts "entered here"
  end

  def send_email(news_letter_id:)
    el_news_letter = NewsLetter.find_by(id: news_letter_id)
    table_join = Recipients.joins("INNER JOIN news_letter_recipients ON news_letter_recipients.news_letter_id=#{news_letter_id} AND recipients.id = news_letter_recipients.recipient_id")

    emails_to_send = []
    table_join.each do |obj|
      emails_to_send.push(obj.email_address)
    end

    if el_news_letter.file.filename.extension_without_delimiter === "png" || el_news_letter.file.filename.extension_without_delimiter === "pdf"

      attachments["tha-file.#{el_news_letter.file.filename.extension_without_delimiter}"] = el_news_letter.file.download

      mail(to: emails_to_send, subject: el_news_letter.name, template_path: "layouts", template_name: "mailer")
    end
  end

  def send_email2(email:, news_letter_id:)
    el_news_letter = NewsLetter.find_by(id: news_letter_id)
    # table_join = Recipients.joins("INNER JOIN news_letter_recipients ON news_letter_recipients.news_letter_id=#{news_letter_id} AND recipients.id = news_letter_recipients.recipient_id")

    # emails_to_send = Array.new
    # table_join.each do |obj|
    #     emails_to_send.push(obj.email_address)
    # end

    @news_letter_name = el_news_letter.name
    @unsubscribe_url = "http://localhost:8000/remove-user?news_letter_id=#{news_letter_id}&email_addresses=#{email}"

    if el_news_letter.file.filename.extension_without_delimiter === "png" || el_news_letter.file.filename.extension_without_delimiter === "pdf"

      attachments["tha-file.#{el_news_letter.file.filename.extension_without_delimiter}"] = el_news_letter.file.download

      mail(to: email, subject: el_news_letter.name, template_path: "layouts", template_name: "mailer")
    end
  end
end
