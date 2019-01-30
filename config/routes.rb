Rails.application.routes.draw do
  # USER ROUTES
  post 'user', to: 'users#create', defaults: {format: :json}
  post 'signin', to: 'authentication#authenticate', defaults: {format: :json}
  
  #TASK ROUTES
  get 'tasks', to: 'tasks#index', defaults: {format: :json}
  post 'tasks', to: 'tasks#create', defaults: {format: :json}
  get 'tasks/:id', to: 'tasks#show', defaults: {format: :json}
  patch 'tasks/changestatus/:id', to: 'tasks#changestatus', defaults: {format: :json}
  get 'tasks/duedates/asc', to: 'tasks#index_duedates_asc', defaults: {format: :json}
  get 'tasks/duedates/desc', to: 'tasks#index_duedates_desc', defaults: {format: :json}
  get 'tasks/description/asc', to: 'tasks#index_description_asc', defaults: {format: :json}
  get 'tasks/description/desc', to: 'tasks#index_description_desc', defaults: {format: :json}
  get 'tasks/priority/asc', to: 'tasks#index_priority_asc', defaults: {format: :json}
  get 'tasks/priority/desc', to: 'tasks#index_priority_desc', defaults: {format: :json}
end
