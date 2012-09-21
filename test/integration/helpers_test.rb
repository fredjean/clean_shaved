require 'test_helper'

class HelpersTest < ActionView::TestCase
  include CleanShaved::Helpers

  test "should precompile the template" do
    CleanShaved.config.compile = true

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

  test "should not precompile the template if compilation is disabled" do
    CleanShaved.config.compile = false

    template = "{{{ message }}}"

    result = template_for :test do
      template
    end
    assert result =~ /#{template}/
    assert result =~ %r{^<script type="text/x-handlebars-template" class="template" name="test">}
    assert result =~ %r{</script>$}
  end
end
