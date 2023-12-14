class UserProject   < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validate :user_is_manager

  private

  def user_is_manager
    unless user&.manager?
      errors.add(:base, 'User must be a manager to be associated with the project')
    end
  end
end
