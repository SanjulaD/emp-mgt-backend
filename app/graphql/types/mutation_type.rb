# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_employee, mutation: Mutations::Employees::CreateEmployee
    field :delete_employee, mutation: Mutations::Employees::DeleteEmployee
  end
end
