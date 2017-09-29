Rails.application.routes.draw do
  scope module: 'api' do
    scope module: 'v1' do
      scope module: 'accounts' do
        resources :authentications, only: :create, path: 'user/auth'
        resources :registrations, only: :create, path: 'user/register'
      end
    end
  end
end
