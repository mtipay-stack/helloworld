Rails.application.routes.draw do
  get "register", to: "registrations#index"
  get "home/index"
  get "home/landing"

  resources :student_guardians
  resources :guardians
  resources :relationships
  resources :staffs
  resources :classlists
  resources :sections
  resources :subjects
  resources :teachers
  resources :students
  resources :departments

 
  root "home#landing"
end
