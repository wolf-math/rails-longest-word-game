Rails.application.routes.draw do
  get 'new', to: 'games#new'
  post 'score_post', to: 'games#score_post'
  get 'score', to: 'games#score'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
