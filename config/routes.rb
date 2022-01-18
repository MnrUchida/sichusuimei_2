Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'people#index'

  resources :people, except: %i[edit update] do
    resources :fortune_of_decades, only: :index, module: :people
    resources :fortune_of_years, only: %i[index show], module: :people
  end
end
