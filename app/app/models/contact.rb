class Contact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  # validates :cpf, presence: true, uniqueness: { scope: :user_id }, cpf: true
  validates :phone, presence: true
  validates :address, presence: true

  # before_save :validate_cpf

  private

  # def validate_cpf
  #   errors.add(:cpf, "is invalid") unless CPF.valid?(cpf)
  # end
end
