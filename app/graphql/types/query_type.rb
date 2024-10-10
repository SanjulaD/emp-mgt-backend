# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :get_employees, resolver: Queries::Employees::GetEmployeesQuery
    field :get_employee_by_id, resolver: Queries::Employees::GetEmployeeByIdQuery
  end
end 
