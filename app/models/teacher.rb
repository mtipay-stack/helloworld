class Teacher < ApplicationRecord
  belongs_to :department
  has_many :subject, dependent: :destroy
end
