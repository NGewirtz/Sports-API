Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    get '/players/:sport', to: 'players#show'
    get '/basketball', to: 'basketballs#index'
    get '/football', to: 'footballs#index'
    get '/baseball', to: 'baseballs#index'
  end
end
