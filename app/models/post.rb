class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,  length: {minimum: 3, maximum: 50}
  validates :des, presence: true, length: {minimum: 3, maximum: 10000}
  mount_uploader :picture, PictureUploader
  after_commit :remove_previously_stored_picture, on: :update
end
