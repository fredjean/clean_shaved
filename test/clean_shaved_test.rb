require 'test_helper'

class CleanShavedTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, CleanShaved
  end

  test "it should compile the templates" do
    template = "{{{ message }}}"

    result = CleanShaved.compile(:test, template)

    assert_not_nil result

    assert result =~ /^function/
    assert result =~ /helpers\.message/
  end
end
