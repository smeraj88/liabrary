Rails.application.routes.draw do
  root to: 'book#list'
    devise_for :users
    get 'book/list'
   get 'book/new' 
   post 'book/create'
      get 'book/edit'
   post '/book/update'
   get 'book/show' 
   get 'book/delete' 
   get 'book/show_subjects'
     
  match '/book' => 'book#create', :via => :post
    match '/book/update/:id' ,:to => 'book#update', :via => :post
 match 'users/sign_out' => "devise/sessions#destroy",:via => :delete  
 
     resources :book
end
