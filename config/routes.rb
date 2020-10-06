Rails.application.routes.draw do
# customersコントローラー
	devise_for :customers, controllers: {
		sessions: 'customers/sessions',
		passwords: 'customers/passwords',
		registrations: 'customers/registrations'
	}

	scope module: :customers do
		root 'homes#top'
		get 'about' => 'homes#about'
	end

	namespace :customers do
		resources :items do
    resources :post_comments, only: [:create, :destroy]
  	end
  	post 'likes/:item_id/create' => 'likes#create', as: 'item_likes'
  	post 'likes/:item_id/destroy' => 'likes#destroy', as: 'item_like'
  end
# 〜〜〜〜〜〜〜〜〜〜〜〜〜

# adminsコントローラー
	devise_for :admins, controllers: {
		sessions: 'admins/sessions',
		passwords: 'admins/passwors',
		registrations: 'admins/registrations'
	}

	namespace :admins do
		root 'homes#top'
		get 'about' => 'homes#about'
		resources :items
	end
# 〜〜〜〜〜〜〜〜〜〜〜
end
