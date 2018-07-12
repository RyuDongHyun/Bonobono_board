Rails.application.routes.draw do
  

  devise_for :users
  root 'works#index'
  resources(:works) #해당하는 데이터의 복수형
  resources(:makers)
  
  get '/admin/users' => 'admin#user'
  get '/admin/users/:id/change' => 'admin#change'

end
