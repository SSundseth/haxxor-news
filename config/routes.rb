HaxxorNews::Application.routes.draw do
  resources :stories
  resources :comments

  resources :stories do
    resources :comments
    post :upvote, :downvote
  end

  resources :comments do
    resources :comments
    post :upvote, :downvote
  end

  root :to => 'stories#index'
  
  match '/:story_order', :to => 'stories#index', :story_order => /daily|weekly|monthly|newest/
end
