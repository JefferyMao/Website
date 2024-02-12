Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] # ユーザーマイページへのルーティング
  get 'travels/link' => 'travels#link'
  get 'travels/hokkaido' => 'travels#hokkaido'
  get 'travels/kanto' => 'travels#kanto'
  get 'travels/hokuriku' => 'travels#hokuriku'
  get 'travels/tokai' => 'travels#tokai'
  get 'travels/chugoku' => 'travels#chugoku'
  get 'travels/shikoku' => 'travels#shikoku'
  get 'travels/kyushu' => 'travels#kyushu'
  get 'travels/kinki' => 'travels#kinki'
  resources :travels do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  root 'travels#index'
end