class Bug < ApplicationRecord
  # belongs_to :qa, class_name: 'User'
  # belongs_to :developer, class_name: 'User', optional: true

  belongs_to :user
  belongs_to :project


  
  validates :title, :status, :type, presence: true

  enum type: {
    bug: 0,
    feature: 1
  }


  enum status: {
    new_bug: 0,
    started: 1,
    resolved: 2,
    completed: 3
  }

end
