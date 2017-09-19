Rails.application.routes.draw do
  resources :articles
  #so here we are setting up the router of the application. We are telling rails that we want the articles model to respond to restful routing
end
