Rails.application.routes.draw do
 
   root to: 'creatives#index'
   get 'creatives/index'
   get 'creatives/list'=>'creatives#list'
   get 'creatives/delete/:id'=>'creatives#delete'
   get 'creatives/new'=>'creatives#new'
   get 'creatives/edit_fy_student/:id' => 'creatives#edit_fy_student'
   post 'creatives/update_fy_student/:id' => 'creatives#update_fy_student'
   post 'creatives/create'=>'creatives#create'
   get 'creatives/edit/:id'=>'creatives#edit'
   get 'creatives/show/:id'=>'creatives#show'
   get 'creatives/show_subjects/:id'=>'creatives#show_subjects'
   post 'creatives/update/:id' => 'creatives#update'
   get 'creatives/fy_student_index'=>'creatives#fy_student_index'
   get  'creatives/issue_book' => 'creatives#issue_book'
   post 'creatives/create_fy_student' => 'creatives#create_fy_student'
   get 'creatives/delete_fy_student/:id' => 'creatives#delete_fy_student'
   
   
   resources :creatives
   devise_for :users
   

end
