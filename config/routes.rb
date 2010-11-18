Financeiro::Application.routes.draw do
  match '/auth/:provider/callback' => 'authentications#create'
  match '/auth/failure' => 'authentications#failure'
  devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions' }
  resources :authentications

  match '/movimentos/:id/listar' => 'movimentos#listar'
  
  resources :agendas
  resources :despesas
  resources :cartaos, :has_many => :faturas
  resources :faturas
  resources :pagamentos
  resources :contas, :has_many => :movimentos
  resources :tipos
  resources :movimentos
  
  root :to => 'contas#dashboard'
  match ':controller(/:action(/:id(.:format)))'
end
