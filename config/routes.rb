Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :taxon_splashes
  end

  resources :orders do
    post :bundle_populate, :on => :collection
  end
end
