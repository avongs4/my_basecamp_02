class Attachment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_one_attached :file

  validates :file, presence: true
end
