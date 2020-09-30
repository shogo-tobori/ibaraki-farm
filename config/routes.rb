Rails.application.routes.draw do
  root 'homes#top'
  get 'about' => 'homes#about'
  devise_for :customers
end
