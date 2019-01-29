Rails.application.routes.draw do
  resources :tasks
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  
  get 'tasks/duedates/asc', to: 'tasks#index_duedates_asc'
  get 'tasks/duedates/desc', to: 'tasks#index_duedates_desc'
  get 'tasks/description/asc', to: 'tasks#index_description_asc'
  get 'tasks/description/desc', to: 'tasks#index_description_desc'
  get 'tasks/priority/asc', to: 'tasks#index_priority_asc'
  get 'tasks/priority/desc', to: 'tasks#index_priority_desc'
end
