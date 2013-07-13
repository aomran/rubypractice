require 'minitest/autorun'
require 'minitest/pride'

ENV["RUBY_ENV"] = "test"

require './spaceage'

class SpaceAgeTest < MiniTest::Unit::TestCase

	def test_create_instances_with_number_of_seconds
		assert_send(:new, 5000 )
		SpaceAge.new(5000)
	end

end