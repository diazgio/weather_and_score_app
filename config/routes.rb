Rails.application.routes.draw do
  root 'home#index'
  get 'weather', to: 'home#weather'
  get 'score', to: 'home#score'
end
