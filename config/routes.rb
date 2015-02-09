Spree::Core::Engine.routes.draw do
  get  'api/sign_in' => 'api/users#sign_in'
  post 'api/sign_in' => 'api/users#reset_password'
end
