class Turn < ApplicationRecord
  belongs_to :client_user, class_name: 'User'
  belongs_to :staff_user, class_name: 'AdminUser', optional: true
  belongs_to :branch_office
end
