# app/models/project.rb
class Project < ApplicationRecord
    has_many :memberships, dependent: :destroy
    has_many :users, through: :memberships
    has_many :attachments, dependent: :destroy
    has_many :discussion_threads, dependent: :destroy

    belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  
    validates :name, presence: true
  end