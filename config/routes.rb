Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get "/merchants/find", to: "merchants#find", defaults: {format: 'json'}
      get "/merchants/find_all", to: "merchants#find_all", defaults: {format: 'json'}
      get "/merchants/random", to: "merchants#random", defaults: {format: 'json'}
      get "/merchants/:id/items", to: "merchants#items",defaults: { :format => 'json' }
      get "/merchants/:id/invoices", to: "merchants#invoices",defaults: { :format => 'json' }
      resources :merchants, except: [:new, :edit], defaults: {format: 'json'}

      get "/customers/find", to: "customers#find", defaults: {format: 'json'}
      get "/customers/find_all", to: "customers#find_all", defaults: {format: 'json'}
      get "/customers/random", to: "customers#random", defaults: {format: 'json'}
      get "/customers/:id/invoices", to: "customers#invoices", defaults: {format: 'json'}
      get "/customers/:id/transactions", to: "customers#transactions", defaults: {format: 'json'}
      resources :customers, except: [:new, :edit], defaults: {format: 'json'}

      get "/items/find", to: "items#find", defaults: {format: 'json'}
      get "/items/find_all", to: "items#find_all", defaults: {format: 'json'}
      get "/items/random", to: "items#random", defaults: {format: 'json'}
      get "/items/:id/invoice_items", to: "items#invoice_items", defaults: {format: 'json'}
      get "/items/:id/merchant", to: "items#merchant", defaults: {format: 'json'}
      resources :items, except: [:new, :edit], defaults: {format: 'json'}

      get "/invoices/find", to: "invoices#find", defaults: {format: 'json'}
      get "/invoices/find_all", to: "invoices#find_all", defaults: {format: 'json'}
      get "/invoices/random", to: "invoices#random", defaults: {format: 'json'}
      get "/invoices/:id/transactions", to: "invoices#transactions",defaults: { :format => 'json' }
      get "/invoices/:id/invoice_items", to: "invoices#invoice_items",defaults: { :format => 'json' }
      get "/invoices/:id/items", to: "invoices#items",defaults: { :format => 'json' }
      get "/invoices/:id/customer", to: "invoices#customer",defaults: { :format => 'json' }
      get "/invoices/:id/merchant", to: "invoices#merchant",defaults: { :format => 'json' }
      resources :invoices, except: [:new, :edit], defaults: {format: 'json'}

      get "/invoice_items/find", to: "invoice_items#find", defaults: {format: 'json'}
      get "/invoice_items/find_all", to: "invoice_items#find_all", defaults: {format: 'json'}
      get "/invoice_items/random", to: "invoice_items#random", defaults: {format: 'json'}
      get "/invoice_items/:id/invoice", to: "invoice_items#invoice", defaults: {format: 'json'}
      get "/invoice_items/:id/item", to: "invoice_items#item", defaults: {format: 'json'}
      resources :invoice_items, except: [:new, :edit], defaults: {format: 'json'}

      get "/transactions/find", to: "transactions#find", defaults: {format: 'json'}
      get "/transactions/find_all", to: "transactions#find_all", defaults: {format: 'json'}
      get "/transactions/random", to: "transactions#random", defaults: {format: 'json'}
      get "/transactions/:id/invoice", to: "transactions#invoice", defaults: {format: 'json'}
      resources :transactions, except: [:new, :edit], defaults: {format: 'json'}
    end
  end
end
