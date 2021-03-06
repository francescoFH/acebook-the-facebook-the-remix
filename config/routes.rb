Rails.application.routes.draw do
  devise_for :users
  get 'home/posts'
  resources :posts do
    resources :likes
  end
  root to: 'posts#index'

  resources  :users do
    resources :posts, only: [:index]
  end
  get 'users/:id/user_posts' => 'users#user_posts', :as => :custom_user_posts


   get 'posts/show', to: "posts#show"
  mount Commontator::Engine => '/commontator'
end
