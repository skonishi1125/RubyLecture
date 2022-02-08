Rails.application.routes.draw do
  root 'home#index' #ヘッダリンク用 http://localhost:3000/
  resources :boards, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :comments, only: %i[create destroy edit update]
end
