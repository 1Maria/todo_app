require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "todos exist" do
    assert todos(:one)
    assert_equal "Water plants", todos(:one).text
  end
end
