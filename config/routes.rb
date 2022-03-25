Rails.application.routes.draw do
  root 'gem_files#new'

  resources :gem_files
end
