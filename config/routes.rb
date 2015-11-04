Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get "/merchants/find", to: "merchants#find", defaults: {format: 'json'}
      get "/merchants/find_all", to: "merchants#find_all", defaults: {format: 'json'}
      get "/merchants/random", to: "merchants#random", defaults: {format: 'json'}
      resources :merchants, except: [:new, :edit], defaults: {format: 'json'}

      get "/customers/find", to: "customers#find", defaults: {format: 'json'}
      get "/customers/find_all", to: "customers#find_all", defaults: {format: 'json'}
      get "/customers/random", to: "customers#random", defaults: {format: 'json'}
      resources :customers, except: [:new, :edit], defaults: {format: 'json'}

      get "/items/find", to: "items#find", defaults: {format: 'json'}
      get "/items/find_all", to: "items#find_all", defaults: {format: 'json'}
      get "/items/random", to: "items#random", defaults: {format: 'json'}
      resources :items, except: [:new, :edit], defaults: {format: 'json'}

      get "/invoices/find", to: "invoices#find", defaults: {format: 'json'}
      get "/invoices/find_all", to: "invoices#find_all", defaults: {format: 'json'}
      get "/invoices/random", to: "invoices#random", defaults: {format: 'json'}
      resources :invoices, except: [:new, :edit], defaults: {format: 'json'}

    end
  end
end
