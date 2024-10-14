Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphql', graphql_path: '/graphql'
  post "/graphql", to: "graphql#execute"
  get "up" => "rails/health#show", as: :rails_health_check
end
