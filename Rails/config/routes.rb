Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'users/me'

  get 'home/index'

  get 'sessions/create'

  get 'sessions/destroy'

  root 'home#index' #ヘッダリンク用 http://localhost:3000/
  resources :boards, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :comments, only: %i[create destroy edit update]
end
