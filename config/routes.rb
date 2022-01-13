Rails.application.routes.draw do
  root to: "people#new"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :people, except: %i[edit update] do
    # resources :fortune_of_decades, only: :index, module: :people
    # resources :fortune_of_years, only: %i[index show], module: :people
  end

  post 'people/fortune_of_decades', to: 'people/fortune_of_decades#index'
  post 'people/fortune_of_years', to: 'people/fortune_of_years#index'
  patch 'people/fortune_of_years', to: 'people/fortune_of_years#show'
end
