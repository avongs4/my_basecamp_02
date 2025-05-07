class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships
  has_many :attachments, dependent: :nullify
  has_many :discussion_threads, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true

  def admin?
    admin == true
  end
end
