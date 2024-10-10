# frozen_string_literal: true

module Queries
  module Employees
    class GetEmployeesQuery < Queries::BaseQuery
      description "Get all employees"
      
      type [Types::EmployeeType], null: true

      def resolve
        begin
          employees = Employee.all
          employees
        rescue ActiveRecord::RecordNotFound
          raise GraphQL::ExecutionError.new("No employees found")
        rescue StandardError => e
          raise GraphQL::ExecutionError.new("An unexpected error occurred: #{e.message}")
        end
      end
    end
  end
end
