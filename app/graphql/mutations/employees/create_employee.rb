# frozen_string_literal: true

module Mutations
  module Employees
    class CreateEmployee < Mutations::BaseMutation
      description "Create a new employee"

      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :email, String, required: true
      argument :number, String, required: true
      argument :gender, String, required: true
      argument :photo, String, required: false

      type Types::EmployeeType

      def resolve(first_name:, last_name:, email:, number:, gender:, photo: nil)
        Validators::EmployeeValidator.validate_create!(first_name, last_name, email, number, gender)
        
        existing_employee = Employee.find_by(email: email)
        if existing_employee
          Rails.logger.warn("Attempted to create an employee with an existing email: #{email}")
          raise GraphQL::ExecutionError.new("An employee with the email #{email} already exists.")
        end

        begin
          employee = Employee.create!(
            first_name: first_name,
            last_name: last_name,
            email: email,
            number: number,
            gender: gender,
            photo: photo
          )

          Rails.logger.info("Employee created successfully: #{employee.inspect}")
          employee
        rescue ActiveRecord::RecordInvalid => e
          Rails.logger.error("Validation failed: #{e.record.errors.full_messages.join(', ')}")
          raise GraphQL::ExecutionError.new("Validation failed: #{e.record.errors.full_messages.join(', ')}")
        rescue StandardError => e
          Rails.logger.error("An unexpected error occurred while creating an employee: #{e.message}")
          raise GraphQL::ExecutionError.new("An unexpected error occurred: #{e.message}")
        end
      end
    end
  end
end
