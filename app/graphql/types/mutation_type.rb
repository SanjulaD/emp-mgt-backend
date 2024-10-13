# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_employee, mutation: Mutations::Employees::CreateEmployee
    field :delete_employee, mutation: Mutations::Employees::DeleteEmployee
    field :update_employee, mutation: Mutations::Employees::UpdateEmployee
  end
end
