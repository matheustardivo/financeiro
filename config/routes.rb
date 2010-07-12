ActionController::Routing::Routes.draw do |map|
  map.resources :agendas

  map.resources :despesas

  map.login "login", :controller => "user_sessions", :action => "login"
  map.logout "logout", :controller => "user_sessions", :action => "logout"
  
  map.resources :cartaos, :has_many => :faturas
  map.resources :faturas
  map.resources :user_sessions
  map.resources :users
  map.resources :pagamentos

  map.resources :contas, :has_many => :movimentos
  map.resources :tipos
  map.resources :movimentos

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.root :controller => "contas"
end
