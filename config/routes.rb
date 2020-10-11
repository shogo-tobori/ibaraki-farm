Rails.application.routes.draw do
# 〜〜〜customersコントローラー〜〜〜
	devise_for :customers, controllers: {
		sessions: 'customers/sessions',
		passwords: 'customers/passwords',
		registrations: 'customers/registrations'
	}
  # ルートパス設定のため、URLのみ変更なし
	scope module: :customers do
		root 'homes#top'
	end

	namespace :customers do
		resources :items, only: [:index, :show] do
      resources :post_comments, only: [:create, :destroy]
  	end
  	resources :events, only: [:index, :show]
    resource :informations, only: [:show, :edit, :update]
    get 'access' => 'homes#access'
    get 'informations/withdraw' => 'informations#withdraw'
    patch 'informations/out' => 'informations#out'
  	post 'likes/:item_id/create' => 'likes#create', as: 'item_likes'
  	post 'likes/:item_id/destroy' => 'likes#destroy', as: 'item_like'
  end
# 〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜

# 〜〜〜adminsコントローラー〜〜〜
	devise_for :admins, controllers: {
		sessions: 'admins/sessions',
		passwords: 'admins/passwors',
		registrations: 'admins/registrations'
	}

	namespace :admins do
		get 'top' => 'homes#top'
		get 'about' => 'homes#about'
		resources :items, expect: [:destroy]
		resources :genres, only: [:index, :create, :edit, :update]
		resources :events, expext: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :post_comments, only:[:index]
    resources :likes, only:[:index]
	end
# 〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜
end
