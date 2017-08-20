Rails.application.routes.draw do
  root to: 'trees#index'

  resources :trees do
    resources :objectives
  end

  resources :objectives do
    resources :completions, controller: 'objectives/completions'
  end

  resources :traits
end
