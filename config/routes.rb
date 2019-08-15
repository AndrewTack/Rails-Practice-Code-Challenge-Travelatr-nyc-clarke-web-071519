Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :destinations
  resources :bloggers

  get '/post/:id/likes', to: "posts#add_like", as: "add_like"

end
