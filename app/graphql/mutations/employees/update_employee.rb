# frozen_string_literal: true

module Mutations
    module Employees
      class UpdateEmployee < Mutations::BaseMutation
        description "Update an existing employee"
  
        argument :id, ID, required: true
        argument :first_name, String, required: false
        argument :last_name, String, required: false
        argument :email, String, required: false
        argument :number, String, required: false
        argument :gender, String, required: false
  
        type Types::EmployeeType
  
        def resolve(id:, first_name: nil, last_name: nil, email: nil, number: nil, gender: nil)
          Validators::EmployeeValidator.validate_create!(first_name, last_name, email, number, gender)
          employee = Employee.find_by(id: id)
          
          if employee.nil?
            Rails.logger.warn("Attempted to update non-existing employee with ID: #{id}")
            raise GraphQL::ExecutionError.new("Employee with ID #{id} not found.")
          end
  
          begin
            employee.update!(
              first_name: first_name || employee.first_name,
              last_name: last_name || employee.last_name,
              email: email || employee.email,
              number: number || employee.number,
              gender: gender || employee.gender
            )
  
            Rails.logger.info("Employee updated successfully: #{employee.inspect}")
            employee
          rescue ActiveRecord::RecordInvalid => e
            Rails.logger.error("Validation failed: #{e.record.errors.full_messages.join(', ')}")
            raise GraphQL::ExecutionError.new("Validation failed: #{e.record.errors.full_messages.join(', ')}")
          rescue StandardError => e
            Rails.logger.error("An unexpected error occurred while updating an employee: #{e.message}")
            raise GraphQL::ExecutionError.new("An unexpected error occurred: #{e.message}")
          end
        end
      end
    end
  end
  