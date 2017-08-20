Rails.application.routes.draw do
  root to: 'trees#index'

  resources :trees do
    resources :objectives
  end

  resources :objectives do
    resources :completions, controller: 'objectives/completions', only: [:new, :create]
    resources :objective_traits, controller: 'objectives/objective_traits'
  end

  resources :traits
end
