# frozen_string_literal: true

Rails.application.routes.draw do
  constraints format: :json do
    resources :todo_items
  end
end
