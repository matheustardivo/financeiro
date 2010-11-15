Financeiro::Application.routes.draw do
  match '/auth/:provider/callback' => 'authentications#create'
  match '/auth/failure' => 'authentications#failure'
  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions' }
  resources :authentications

  resources :agendas
  resources :despesas
  resources :cartaos, :has_many => :faturas
  resources :faturas
  resources :pagamentos
  resources :contas, :has_many => :movimentos
  resources :tipos
  resources :movimentos
  
  root :to => 'contas#index'
  match ':controller(/:action(/:id(.:format)))'
end
