# == Schema Information
#
# Table name: goods
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  entry_id   :integer
#  user_id    :integer
#

require 'test_helper'

class GoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
