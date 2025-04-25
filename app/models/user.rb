class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attachments, dependent: :nullify
  has_many :discussion_threads, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many :project_memberships, dependent: :destroy  # ✅ missing
  has_many :projects, through: :project_memberships    # ✅ missing

  validates :name, presence: true
end
