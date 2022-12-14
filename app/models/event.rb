class Event < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :comments
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

  validates :title, presence: true, length: {maximum: 255}
  validates :address, presence: true
  validates :datetime, presence: true

  def visitors
    (subscribers + [user]).uniq
  end

end
