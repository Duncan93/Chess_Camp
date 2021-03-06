ChessCamp::Application.routes.draw do
  

  # generated routes
  resources :curriculums
  resources :instructors
  resources :camps
  resources :families
  resources :instructors
  resources :locations
  resources :registrations
  resources :students
  resources :users
  resources :sessions

  # session routes
  get 'user/edit' => 'users#edit', as: :edit_current_user
  get 'signup' => 'users#new', as: :signup
  get 'login' => 'sessions#new', as: :login
  get 'logout' => 'sessions#destroy', as: :logout

  # semi-static routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy

  # report routes
  get 'camps/:id/camp_payment_report', to: 'camps#camp_payment_report', as: :camp_payment_report
  get 'families/:id/family_payment_report', to: 'families#family_payment_report', as: :family_payment_report
  get 'home/year_payment_report', to: 'home#year_payment_report', as: :year_payment_report

  
  # set the root url
  root to: 'home#index'

end
