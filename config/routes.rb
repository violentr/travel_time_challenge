Rails.application.routes.draw do
  root 'welcome#index', via: [:get, :post]
  get 'welcome/list_areas'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
