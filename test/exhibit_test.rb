require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'


class ExhibitTest < Minitest::Test
  def setup
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end

  def test_it_exists
    assert_instance_of Exhibit, @exhibit
  end

  def test_it_has_name
    assert_equal "Gems and Minerals", @exhibit.name
  end
end
