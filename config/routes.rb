Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :taxon_splashes
  end
end
