class Project < ApplicationRecord
  belongs_go :company
  has_many :messages
end
