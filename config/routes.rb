Rails.application.routes.draw do
  get 're_prue/', to: 're_prue#index', as: 'prueindex'
  get 're_prue/show/:id', to: 're_prue#show', as: 'prueshow'
  get 're_prue/edit/:id', to: 're_prue#edit', as: 'prueedit'
  get 're_prue/new', to: 're_prue#new', as: 'pruenew'
  post 're_prue/save', to: 're_prue#save', as: "pruesave"
  post 're_prue/delete', to: 're_prue#delete', as: "pruedelete"

  get 're_prue/search', to: 're_prue#search', as: "pruesearch"

  get 'gn_terc/', to: 'gn_terc#index', as: 'tercindex'
  get 'gn_terc/new', to: 'gn_terc#new', as: 'tercnew'
  get 'gn_terc/edit/:id', to: 'gn_terc#edit', as: 'tercedit'
  get 'gn_terc/show/:id', to: 'gn_terc#show', as: 'tercshow'
  post 'gn_terc/save', to: 'gn_terc#save', as: "tercsave"
  post 'gn_terc/delete', to: 'gn_terc#delete', as: "tercdelete"
  post 'gn_terc/document', to: 'gn_terc#check_document', as: "tercdocument"
  post 'gn_terc/user', to: 'gn_terc#check_user', as: "tercuser"
  # post 'gn_terc/disable', to: 'gn_terc#disable', as: "tercdisable"


  get 'logs/system', to: 'logs#system', as: "logs"

  get 'home/', to: 'home#index', as: "home"

  get 'login/', to: 'login#index', as: "login"
  post 'login/auth', to: 'login#auth', as: "loginauth"
  get 'logout/', to: 'login#logout', as: "logout"

  get 'gn_tusu/', to: 'gn_tusu#index', as: "tusuindex"
  post 'gn_tusu/save', to: 'gn_tusu#save', as: "tususave"
  post 'gn_tusu/show', to: 'gn_tusu#show', as: "tusushow"
  post 'gn_tusu/delete', to: 'gn_tusu#delete', as: "tusudelete"
  post 'gn_tusu/desc', to: 'gn_tusu#check_desc', as: "tuscheck_desc"

  get 'gn_tdoc/', to: 'gn_tdoc#index', as: "tdocindex"
  post 'gn_tdoc/save', to: 'gn_tdoc#save', as: "tdocsave"
  post 'gn_tdoc/show', to: 'gn_tdoc#show', as: "tdocshow"
  post 'gn_tdoc/delete', to: 'gn_tdoc#delete', as: "tdocdelete"
  post 'gn_tdoc/desc', to: 'gn_tdoc#check_desc', as: "tdoccheck_desc"

  get 'au_crud/', to: 'au_crud#index', as: "crudindex"
  post 'au_crud/save', to: 'au_crud#save', as: "crudsave"
  post 'au_crud/show', to: 'au_crud#show', as: "crudshow"
  post 'au_crud/delete', to: 'au_crud#delete', as: "cruddelete"
  post 'au_crud/desc', to: 'au_crud#check_desc', as: "crudcheck_desc"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
