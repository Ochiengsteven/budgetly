class Entity < ApplicationRecord
  belongs_to :group, class_name: 'Group', foreign_key: 'group_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: { allow_float: true, greater_than_or_equal_to: 0 }
end
