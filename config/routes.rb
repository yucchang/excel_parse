Rails.application.routes.draw do
  resources :invoices
  resources :import_invoices, only: [:new, :create]

  root "invoices#index"
end
