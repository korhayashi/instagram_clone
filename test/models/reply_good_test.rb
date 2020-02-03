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

require 'test_helper'

class ReplyGoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
