# frozen_string_literal: true

module Queries
    module Employees
      class GetEmployeeByIdQuery < Queries::BaseQuery
        description 'Get an employee by ID'
  
        argument :id, ID, required: true
        type Types::EmployeeType, null: true
  
        def resolve(id:)
          begin
            employee = Employee.find(id)
            employee
          rescue ActiveRecord::RecordNotFound
            raise GraphQL::ExecutionError.new("Employee with ID #{id} not found")
          rescue StandardError => e
            raise GraphQL::ExecutionError.new("An unexpected error occurred: #{e.message}")
          end
        end
      end
    end
  end
  