# frozen_string_literal: true

module Mutations
  module Employees
    class DeleteEmployee < Mutations::BaseMutation
      description "Delete an employee by ID"

      argument :id, ID, required: true

      type Types::EmployeeType

      def resolve(id:)
        Validators::EmployeeValidator.validate_id!(id)
        
        employee = Employee.find_by(id: id)

        Rails.logger.info("Attempting to delete employee with ID: #{id}")

        unless employee
          Rails.logger.warn("Delete attempt failed: Employee not found with ID: #{id}")
          raise GraphQL::ExecutionError.new("Employee not found.")
        end

        begin
          employee.destroy
          Rails.logger.info("Successfully deleted employee with ID: #{id}")
          employee
        rescue StandardError => e
          Rails.logger.error("Error deleting employee with ID: #{id}: #{e.message}")
          raise GraphQL::ExecutionError.new("An unexpected error occurred: #{e.message}")
        end
      end
    end
  end
end
