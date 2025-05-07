# app/models/attachment.rb
class Attachment < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_one_attached :file  # if you’re using ActiveStorage
  # or, if you want to store a filename/path yourself:
  # validates :file, presence: true
end