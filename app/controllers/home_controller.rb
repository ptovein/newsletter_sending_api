class HomeController < ApplicationController
  def method2
    el_news_letter = NewsLetter.find_by(id: 3)
    puts url_for(el_news_letter.file)

    redirect_to rails_blob_path(el_news_letter.file, disposition: "attachment")
  end

  def create_news_letter
    if params.include?("name")
      news_letter_to_create = NewsLetter.new(name: params[:name])
      news_letter_to_create.save
      render status: 201, json: {response: {id: news_letter_to_create[:id], text: "News letter created"}}
    else
      render status: 400, json: {response: "the required input has not been received"}
    end
  end

  def add_recipients
    if params.include?("news_letter_id") && params.include?("email_addresses")
      emails_to_add = []
      recipient_ids = []
      params[:email_addresses].each do |email|
        if URI::MailTo::EMAIL_REGEXP.match?(email)
          emails_to_add.push(email)
          recipient_exists = Recipients.find_by(email_address: email)
          if recipient_exists.nil?
            new_recipient = Recipients.new(email_address: email)
            new_recipient.save
            recipient_ids.push(new_recipient[:id])
          else
            recipient_ids.push(recipient_exists[:id])
          end
        end
      end

      recipient_ids.each do |rec_id|
        news_let_to_save = NewsLetterRecipient.new(news_letter_id: params[:news_letter_id], recipient_id: rec_id)
        news_let_to_save.save
      end

    else
      render status: 400, json: {response: "the required input has not been received"}
    end
  end

  def add_file
    if params.include?("news_letter_id") && params.include?("thaFile")
      tha_news_let = NewsLetter.find_by(id: params[:news_letter_id])

      if tha_news_let.nil?
        render status: 500, json: {response: "the inputted news_letter_id doesn't match to any on the user's table"}
      else
        file_data = params[:thaFile]
        tha_news_let.file.attach(params[:thaFile])
        tha_news_let.save
        render status: 201
      end
    else
      render status: 400, json: {response: "the required input has not been received"}
    end
  end

  def get_file_url
    if params.include?("news_letter_id")
      tha_news_let = NewsLetter.find_by(id: params[:news_letter_id])
      if tha_news_let.nil?
        render status: 500, json: {response: "the inputted news_letter_id doesn't match to any on the user's table"}
      else
        render status: 200, json: {response: rails_blob_path(tha_news_let.file, disposition: "attachment")}
      end
    else
      render status: 400, json: {response: "the required input has not been received"}
    end
  end

  def remove_users
    if params.include?("news_letter_id") && params.include?("email_addresses")
      recipients = Recipients.where(email_address: params[:email_addresses])

      recipient_ids = []
      recipients.each do |obj|
        recipient_ids.push(obj.id)
      end

      NewsLetterRecipient.destroy_by(news_letter_id: params[:news_letter_id], recipient_id: recipient_ids)
      render status: 200, json: {response: "The resources that matched the params were deleted"}
    else
      render status: 400, json: {response: "the required input has not been received"}
    end
  end

  def send_news_letter
    el_news_letter = NewsLetter.find_by(id: params[:news_letter_id])
    table_join = Recipients.joins("INNER JOIN news_letter_recipients ON news_letter_recipients.news_letter_id=#{params[:news_letter_id]} AND recipients.id = news_letter_recipients.recipient_id")

    emails_to_send = []
    table_join.each do |obj|
      emails_to_send.push(obj.email_address)
      NewsLetterMailer.send_email2(email: obj.email_address, news_letter_id: params[:news_letter_id]).deliver_now
    end

    # find the emails here and call this function as many times as emails are
    # NewsLetterMailer.send_email2(email: params[:news_letter_id]).deliver_now
  end

  def news_letter_ids
    tha_news_letters = NewsLetter.all

    if tha_news_letters.length === 0
      render status: 204
    else
      news_letter_ids = []
      tha_news_letters.each do |obj|
        news_letter_ids.push(obj.id)
      end
      render status: 200, json: {response: news_letter_ids}
    end
  end

  def news_letters
    tha_news_letters = NewsLetter.all

    if tha_news_letters.length === 0
      render status: 204
    else
      news_letters = []
      tha_news_letters.each do |obj|
        hash_to_save = {"id" => obj.id, "name" => obj.name}
        news_letters.push(hash_to_save)
      end
      render status: 200, json: {response: news_letters}
    end
  end
end
