BoosterworksRails::Application.routes.draw do

  match "/about" => "static_pages#about"
  match "/faq" => "static_pages#faq"
  match "/pricing" => "static_pages#pricing"
  match "/tour" => "static_pages#tour"

  authenticated :user do
    root :to => 'accounts#dashboard'
  end
  root :to => "home#index"

  devise_for :users
  resources :users, :only => [:show, :index]
  resources :accounts do
    get :autocomplete_account_name, :on => :collection
  end

end
