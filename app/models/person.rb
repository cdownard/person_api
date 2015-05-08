class Person < ActiveRecord::Base
  validates :email, uniqueness: true
end
