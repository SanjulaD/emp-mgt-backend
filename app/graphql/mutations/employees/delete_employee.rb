# frozen_string_literal: true

module Mutations
    module Employees
      class DeleteEmployee < Mutations::BaseMutation
        description "Delete an employee by ID"
  
        argument :id, ID, required: true
  
        type Types::EmployeeType
  
        def resolve(id:)
          # Find the employee by ID
          employee = Employee.find_by(id: id)
  
          # Raise an error if the employee is not found
          unless employee
            raise GraphQL::ExecutionError.new("Employee not found.")
          end
  
          begin
            # Destroy the employee record
            employee.destroy
            employee # Return the deleted employee
          rescue StandardError => e
            raise GraphQL::ExecutionError.new("An unexpected error occurred: #{e.message}")
          end
        end
      end
    end
  end
  