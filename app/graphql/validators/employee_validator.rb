# frozen_string_literal: true

module Validators
    class EmployeeValidator
      def self.validate_create!(first_name, last_name, email, number, gender)
        if first_name.blank? || last_name.blank? || email.blank? || number.blank? || gender.blank?
          raise GraphQL::ExecutionError.new("All fields are required.")
        end
  
        unless email =~ URI::MailTo::EMAIL_REGEXP
          raise GraphQL::ExecutionError.new("Invalid email format.")
        end
      end
  
      def self.validate_id!(id)
        unless id.present? && id.match?(/\A\d+\z/)
          raise GraphQL::ExecutionError.new("Invalid employee ID.")
        end
      end
    end
  end
  