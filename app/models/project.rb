class Project < ApplicationRecord
    has_many :project_memberships
    has_many :users, through: :project_memberships
    has_many :attachments, dependent: :destroy
    has_many :discussion_threads, dependent: :destroy


  
    validates :title, presence: true
  end
  