class NewsLetterMailer < ApplicationMailer
  default from: "fguzmang523@gmail.com"

  include Rails.application.routes.url_helpers

  def welcome_email
    puts "entered here"
  end

  def send_email2(email:, news_letter_id:)
    el_news_letter = NewsLetter.find_by(id: news_letter_id)

    @news_letter_name = el_news_letter.name
    @unsubscribe_url = "http://localhost:8000/remove-user?news_letter_id=#{news_letter_id}&email_addresses=#{email}"

    if el_news_letter.file.filename.extension_without_delimiter === "png" || el_news_letter.file.filename.extension_without_delimiter === "pdf"

      attachments["tha-file.#{el_news_letter.file.filename.extension_without_delimiter}"] = el_news_letter.file.download

      mail(to: email, subject: el_news_letter.name, template_path: "layouts", template_name: "mailer")
    end
  end

  def send_email3(email:, news_letter_id:)
    el_news_letter = NewsLetter.find_by(id: news_letter_id)

    @news_letter_name = el_news_letter.name
    @unsubscribe_url = "http://localhost:8000/remove-user?news_letter_id=#{news_letter_id}&email_addresses=#{email}"

    if el_news_letter.file.filename.extension_without_delimiter === "png" || el_news_letter.file.filename.extension_without_delimiter === "pdf"

      attachments["tha-file.#{el_news_letter.file.filename.extension_without_delimiter}"] = el_news_letter.file.download

      mail(to: email, subject: el_news_letter.name, template_path: "layouts", template_name: "mailer")
    end
  end

  def send_email4(email:, news_letter_id:)
    el_news_letter = NewsLetter.find_by(id: news_letter_id)

    @news_letter_name = el_news_letter.name
    @unsubscribe_url = "http://localhost:8000/remove-user?news_letter_id=#{news_letter_id}&email_addresses=#{email}"

    if el_news_letter.file.filename.extension_without_delimiter === "png" || el_news_letter.file.filename.extension_without_delimiter === "pdf"

      attachments["tha-file.#{el_news_letter.file.filename.extension_without_delimiter}"] = el_news_letter.file.download

      mail(to: email, subject: el_news_letter.name, template_path: "layouts", template_name: "mailer")
    end
  end

  def send_email5(email:, news_letter_id:)
    el_news_letter = NewsLetter.find_by(id: news_letter_id)

    @news_letter_name = el_news_letter.name
    @unsubscribe_url = "http://localhost:8000/remove-user?news_letter_id=#{news_letter_id}&email_addresses=#{email}"

    if el_news_letter.file.filename.extension_without_delimiter === "png" || el_news_letter.file.filename.extension_without_delimiter === "pdf"

      attachments["tha-file.#{el_news_letter.file.filename.extension_without_delimiter}"] = el_news_letter.file.download

      mail(to: email, subject: el_news_letter.name, template_path: "layouts", template_name: "mailer")
    end
  end


  def send_email6(email:, news_letter_id:)
    el_news_letter = NewsLetter.find_by(id: news_letter_id)

    @news_letter_name = el_news_letter.name
    @unsubscribe_url = "http://localhost:8000/remove-user?news_letter_id=#{news_letter_id}&email_addresses=#{email}"

    if el_news_letter.file.filename.extension_without_delimiter === "png" || el_news_letter.file.filename.extension_without_delimiter === "pdf"

      attachments["tha-file.#{el_news_letter.file.filename.extension_without_delimiter}"] = el_news_letter.file.download

      mail(to: email, subject: el_news_letter.name, template_path: "layouts", template_name: "mailer")
    end
  end


  def send_email7(email:, news_letter_id:)
    el_news_letter = NewsLetter.find_by(id: news_letter_id)

    @news_letter_name = el_news_letter.name
    @unsubscribe_url = "http://localhost:8000/remove-user?news_letter_id=#{news_letter_id}&email_addresses=#{email}"

    if el_news_letter.file.filename.extension_without_delimiter === "png" || el_news_letter.file.filename.extension_without_delimiter === "pdf"

      attachments["tha-file.#{el_news_letter.file.filename.extension_without_delimiter}"] = el_news_letter.file.download

      mail(to: email, subject: el_news_letter.name, template_path: "layouts", template_name: "mailer")
    end
  end

  def send_email8(email:, news_letter_id:)
    el_news_letter = NewsLetter.find_by(id: news_letter_id)

    @news_letter_name = el_news_letter.name
    @unsubscribe_url = "http://localhost:8000/remove-user?news_letter_id=#{news_letter_id}&email_addresses=#{email}"

    if el_news_letter.file.filename.extension_without_delimiter === "png" || el_news_letter.file.filename.extension_without_delimiter === "pdf"

      attachments["tha-file.#{el_news_letter.file.filename.extension_without_delimiter}"] = el_news_letter.file.download

      mail(to: email, subject: el_news_letter.name, template_path: "layouts", template_name: "mailer")
    end
  end

end
