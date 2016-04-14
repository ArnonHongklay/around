Rails.application.routes.draw do
  devise_for :users
  root to: 'greetings#hello'

  mount Bloggy::Engine, at: '/blog'
end
