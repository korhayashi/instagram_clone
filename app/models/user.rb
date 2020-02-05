# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  user_image      :string
#  user_name       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email      (email) UNIQUE
#  index_users_on_user_name  (user_name) UNIQUE
#

class User < ApplicationRecord
  has_many :entries
  has_many :replies
  has_many :goods, dependent: :destroy
  has_many :reply_goods, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :my_bookmarks, through: :bookmarks, source: :entry

  validates :name, presence: true, length: { maximum: 30 }
  validates :user_name, presence: true, length: { maximum: 30 },
             uniqueness: true
  before_validation { email.downcase! }
  validates :email, presence: true, length: { maximum: 255 },
             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
             uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 },
             on: :create
  validates :password, length: { minimum: 6 },allow_blank: true, on: :update
  mount_uploader :user_image, ImageUploader
end
