Rails.application.routes.draw do

	devise_for :admins, controllers: {
		sessions: 'admins/sessions',
		passwords: 'admins/passwors',
		registrations: 'admins/registrations'
	}

	devise_for :customers, controllers: {
		sessions: 'customers/sessions',
		passwords: 'customers/passwords',
		registrations: 'customers/registrations'
	}

	root 'homes#top'
	get 'about' => 'homes#about'
end
