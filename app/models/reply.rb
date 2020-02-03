# == Schema Information
#
# Table name: replies
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  entry_id   :bigint
#
# Indexes
#
#  index_replies_on_entry_id  (entry_id)
#
# Foreign Keys
#
#  fk_rails_...  (entry_id => entries.id)
#

class Reply < ApplicationRecord
  belongs_to :entry
  has_many :reply_goods, dependent: :destroy
  has_many :reply_good_users, through: :reply_goods, source: :user

  validates :content, presence: true
end
