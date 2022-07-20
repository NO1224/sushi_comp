class Food < ApplicationRecord
  has_many :grade_foods
  has_many :grades, through: :grade_foods
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
end
