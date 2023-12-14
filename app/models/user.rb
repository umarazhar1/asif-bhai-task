class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects

  has_many :bugs

  enum user_type: {
    developer: 0,
    manager: 1,
    qa: 2
  }
  after_initialize :set_default_user_type, if: :new_record?

  def set_default_user_type
    self.user_type ||= :user
  end
end
