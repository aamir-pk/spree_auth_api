Spree::Core::Engine.routes.draw do
  get 'api/sign_in' => 'api/users#sign_in'
end
