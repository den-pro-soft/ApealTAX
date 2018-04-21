Rails.application.routes.draw do
  resources :propertys

  get 	'selection_property/index'
  post 	'selection_property/index'
  get 	'selection_property/confirm'
  post 	'selection_property/confirm'
  get 	'selection_property/sales'
  post 	'selection_property/sales'
  get   'selection_property/exemptions'
  post  'selection_property/exemptions'

  get 	'selection_property/save'
  post 	'selection_property/save'
  get   'selection_property/contract'
  post  'selection_property/contract'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 	'application#hello'
end
