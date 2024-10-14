# frozen_string_literal: true

module Queries
  module Employees
    class GetEmployeesQuery < Queries::BaseQuery
      description "Get all employees"
      
      type [Types::EmployeeType], null: true

      argument :search, String, required: false
      argument :sort_by, String, required: false
      argument :sort_order, String, required: false

      def resolve(search: nil, sort_by: nil, sort_order: nil)
        Rails.logger.info "Fetching employees with search: #{search.inspect}, sort_by: #{sort_by.inspect}, sort_order: #{sort_order.inspect}"

        begin
          employees = Employee.all

          # Apply search functionality
          if search.present?
            Rails.logger.info "Applying search filter: #{search}"
            employees = employees.where('LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ? OR LOWER(email) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
          end

          sort_by ||= 'created_at'  # Default to 'created_at' if not provided
          sort_order ||= 'desc'  # Default to descending order
          Rails.logger.info "Sorting employees by: #{sort_by} in #{sort_order} order"
          employees = employees.order("#{sort_by} #{sort_order}")

          Rails.logger.info "Successfully fetched #{employees.count} employees."
          employees
        rescue StandardError => e
          Rails.logger.error "An error occurred while fetching employees: #{e.message}"
          raise GraphQL::ExecutionError.new("An unexpected error occurred: #{e.message}")
        end
      end
    end
  end
end
