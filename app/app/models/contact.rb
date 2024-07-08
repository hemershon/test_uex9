class Contact < ApplicationRecord
  belongs_to :user
  validates :cpf, presence: true, uniqueness: true, cpf: true
end
