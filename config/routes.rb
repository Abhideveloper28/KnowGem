Rails.application.routes.draw do
  root 'gem_files#new'

  resource :gem_files
end
