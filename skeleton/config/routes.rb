Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:new, :create] do
    member do
      post :approve
      post :deny
    end
  end

  resources :users, only: [:new, :create] 
  resource :session, only: [:new, :create, :destroy]  
  # singular! A visitor to your site implicitly has their own session (it's stored in their browser), so there's no need to create routes for different sessions.

  root to: redirect('/cats')
end


