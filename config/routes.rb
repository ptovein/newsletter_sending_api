Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post "/second-route", to: "home#method2"

  get "/file-url", to: "home#get_file_url"
  get "/send-news-letter", to: "home#send_news_letter"
  get "/news-letters", to: "home#news_letters"
  get "/news-letter-ids", to: "home#news_letter_ids"
  get "/remove-user", to: "home#remove_users"

  post "/create-news-letter", to: "home#create_news_letter"
  post "/add-recipients", to: "home#add_recipients"
  post "/add-file", to: "home#add_file"
  post "/remove-users", to: "home#remove_users"

  # Defines the root path route ("/")
  # root "articles#index"
end
