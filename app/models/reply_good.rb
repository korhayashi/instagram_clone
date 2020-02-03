# == Schema Information
#
# Table name: reply_goods
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  reply_id   :integer
#  user_id    :integer
#

class ReplyGood < ApplicationRecord
  belongs_to :user
  belongs_to :reply
end
