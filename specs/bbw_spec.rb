require('minitest/autorun')
require('minitest/rg')
require_relative('../models/bbw')

class TestBbw < MiniTest::Test

  def setup
    # options = {
    #   "first_name" => "Tony",
    #   "last_name" => "Goncalves",
    #   "nights" => "4",
    #   "breakfast" => "yes",
    #   "room_type" => "single"
    # }

    @bbw = Bbw.new( options )
  end

  def test_first_name()
    assert_equal("Tony", @bbw.first_name())
  end

  def test_pretty_name()
    assert_equal("Tony Goncalves", @bbw.pretty_name())
  end

  def test_total()
    assert_equal(180, @bbw.total())
  end





end


