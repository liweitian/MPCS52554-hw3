Rails.application.routes.draw do
  root  'navigations#welcome'
  get  '/login'  =>  'sessions#new'
  post '/login' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#index'
  get '/users/delete/:id' => 'users#delete'

  get '/api/inventory/:apiKey' => 'items#index'
  get '/api/inventory/:apiKey/:sku' => 'items#show'
  post '/api/inventory' => 'items#add'


  post '/api/orders' => 'items#ship'
  get '/api/checkAPIkey/:apiKey' => 'users#checkAPIkey'
  get  '/FAQ'   =>  'navigations#FAQ'

end
