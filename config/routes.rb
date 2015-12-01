Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :reports, only: [:index] do
      collection do
        get :sales_total
        post :sales_total
        get :products_ran_out_of_stock
        post :products_ran_out_of_stock
      end
    end
  end
end
