# == Schema Information
#
# Table name: entries
#
#  id         :bigint           not null, primary key
#  content    :text
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_entries_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Entry < ApplicationRecord
  has_many :replies, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :good_users, through: :goods, source: :user
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user
  belongs_to :user

  mount_uploader :image, ImageUploader
  validates :image, presence: true
end
