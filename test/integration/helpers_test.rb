require 'test_helper'

class HelpersTest < ActionView::TestCase
  include CleanShaved::Helpers

  test "it should precompile the template" do
    template = "{{{ message }}}"

    result = template_for :test do
      template
    end

    compiled_template = CleanShaved.compile(:test2, template).gsub(/\s+/, ' ')

    assert result.include? compiled_template
    assert result =~ %r{^<script type="text/javascript">}
    assert result =~ %r{</script>$}
    assert result = %{Handlebars.templates['test']}
  end
end
