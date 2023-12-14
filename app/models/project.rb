class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects

  has_many :bugs

  validate :at_least_one_user_is_manager

  private

  def at_least_one_user_is_manager
    unless users.any?(&:manager?)
      errors.add(:base, 'At least one user must be a manager for the project')
    end
  end
end
