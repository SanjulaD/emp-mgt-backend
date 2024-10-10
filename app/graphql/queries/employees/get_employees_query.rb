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

          # Apply sorting functionality
          if sort_by.present?
            sort_order = sort_order == 'desc' ? 'desc' : 'asc' # default to ascending
            Rails.logger.info "Sorting employees by: #{sort_by} in #{sort_order} order"
            employees = employees.order("#{sort_by} #{sort_order}")
          end

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
