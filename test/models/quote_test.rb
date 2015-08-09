require 'test_helper'

class QuoteTest < ActiveSupport::TestCase

	test "unique_tag" do
		quote = Quote.create(:author => 'Michael Scott', :saying => 'I want some milk.')
		expected = 'MS#' + quote.id.to_s
		actual = quote.unique_tag
		assert_equal expected, actual
	end
  # test "the truth" do
  #   assert true
  # end
end
