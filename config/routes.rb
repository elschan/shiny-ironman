ShinyIronman::Application.routes.draw do
  devise_for :members, controllers: {sessions: "sessions", invitations: "invitations"} #:controllers => { :invitations => 'members/invitations'}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :comments, only: [:show, :destroy, :create] do
    member do
      put "vote", to: "comments#vote"
    end
  end


  get 'tags/:tag', to: 'posts#index', as: "tag"
  get "posts/newest", to: "posts#newest"
  get "posts/projects", to: "posts#projects"
  get "posts/jobs", to: "posts#jobs"
  get "posts/news", to: "posts#news"
  get "posts/events", to: "posts#events"

  resources :notifications, only: [:edit]

  resources :signups, only: [:create, :new] do
    member do
      put "accepted"
    end
  end
# map.resources :posts do |posts|
#   posts.resources :newest
# end
  

  resources :posts do
    member do
      put "vote", to: "posts#vote"
    end
    resources :comments, only: [:create, :new]
  end


  resources :coffeemeets 
  resources :about, only: [:index]
  resources :faq, only: [:index]

  resources :members do
   resources :coffeemeets do
      member do
        put "remove_from_profile", to: "coffeemeets#remove"
      end
   end
    member do
      post 'ban'
    end
  end
  
  get "members/:location", to: "members#index", as: "location"


  # You can have the root of your site routed with "root"
  root 'posts#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
