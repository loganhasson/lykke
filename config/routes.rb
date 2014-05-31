Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    get 'sign_in', to: 'static_pages#index', as: :new_user_session
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  get '/summaries' => 'summaries#index', as: 'summaries'
  post '/summaries' => 'summaries#create'
  get '/summaries/new' => 'summaries#new', as: 'new_summary'

  get '/feeds/global' => 'feeds#global', as: 'global_feed'
end
