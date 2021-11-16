Rails.application.routes.draw do
  get "change_color", action: :change_color, controller: 'hours'
  resources :hours
  resources :rooms do
    resources :hours do
      resources :seats
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "show_rooms#index"

end
