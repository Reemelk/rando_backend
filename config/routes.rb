Rails.application.routes.draw do
  scope 'api', defaults: { format: :json }  do
    scope module: 'api' do
      scope module: 'v1' do
        scope module: 'accounts' do
          resources :authentications, only: :create, path: 'auth'
          resources :registrations, only: :create, path: 'register'
        end
        scope module: 'characters' do
          resources :characters, only: :show, param: :user_id
          resources :characters, only: [:create, :update, :destroy]
        end
        scope module: 'groups' do
          get '/groups/type/:type/srv/:server/lvl/:level/', to: 'groups#index'
          resources :groups, only: [:show, :create, :update]
          resources :update_token_statuses, only: :show
        end
        scope module: 'users' do
          resources :current_group, only: :show
        end
      end
    end
  end
end
