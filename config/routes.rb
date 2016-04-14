Rails.application.routes.draw do
  devise_for :users
  root to: 'greetings#hello'

  # mount Bloggy::Engine, at: '/blog'
  namespace :blog do
    get "/" => "posts#index", as: "show"
    get "/page/:page", to:  "posts#index", as:  "posts_page"
    get "/feed" => "posts#feed", as:  "feed", defaults: {format: :rss}

    get "/tags/:tag" =>"tags#show", as: "tags_page"

    namespace :admin, path: "editor" do
      get "/" => "posts#index", as:  "" # responds to blog_admin_url and blog_admin_path
      get "/page/:page", to:  "posts#index", as:  "posts_page"
      get "logout" => "sessions#destroy"
      get "login" => "sessions#new"
      resources :sessions
      resources :posts
      resources :users
      get "comments" => "comments#show", as: "comments"

      match "/post/preview"=>"posts#preview", :as=>"post_preview", :via => [:put, :post]
    end

    get "*post_url" => "posts#show", as:  "post"
  end
end
