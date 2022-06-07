Rails.application.routes.draw do
  resources :contacts do
    collection do
      post :broadcast
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "contacts#index"
end
