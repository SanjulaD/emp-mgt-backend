# frozen_string_literal: true

# Schema Information
# 
# Table name: employees
#
# id         :integer          not null, primary key
# first_name :string           not null, limit: 50
# last_name  :string           not null, limit: 50
# email      :string           not null, unique
# number     :string           not null
# gender     :string           not null, inclusion: { in: ['M', 'F'] }
# photo      :string           not null
# created_at :datetime         not null
# updated_at :datetime         not null
#

class Employee < ApplicationRecord

end
