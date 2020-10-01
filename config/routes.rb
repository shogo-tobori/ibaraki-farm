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
		resources :items
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
