Financeiro::Application.routes.draw do
  devise_for :users

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
