# == Schema Information
#
# Table name: questions
#
#  id           :bigint           not null, primary key
#  for_banks    :boolean
#  for_partners :boolean
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Question < ApplicationRecord
  has_rich_text :answer
  validates :answer, presence: true
  validates :title, presence: true
  validates :for_banks, acceptance: {message: "and for partners can't both be unchecked"}, unless: :for_partners
  validates :for_partners, acceptance: {message: "and for banks can't both be unchecked"}, unless: :for_banks
  scope :for_banks, -> { where(for_banks: true) }
  scope :for_partners, -> { where(for_partners: true) }
end
