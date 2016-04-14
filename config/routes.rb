Rails.application.routes.draw do
  root to: 'greetings#hello'

  mount Bloggy::Engine, at: '/blog'
end
