class DiscussionThread < ApplicationRecord
  belongs_to :project
  belongs_to :user  # admin who created the thread
  has_many :messages, dependent: :destroy

  validates :title, presence: true
end
