Rails.application.routes.draw do
  root 'bulletin_board#index' 

  get 'bulletin_board/index'
  post 'bulletin_board/index'

  get '', to: 'bulletin_board#index'
  post '', to: 'bulletin_board#index'
  get 'bulletin_board', to: 'bulletin_board#index'
  post 'bulletin_board', to: 'bulletin_board#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
