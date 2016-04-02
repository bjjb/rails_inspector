require 'pathname'

class RailsInspector < Struct.new(:root)
  autoload :VERSION, "rails_inspector/version"

  def root
    Pathname.new(super).expand_path
  end

  def files
    app_files + lib_files + test_files
  end

  def app_files
    glob("app/**/*.rb")
  end

  def lib_files
    glob("lib/**/*.rb")
  end

  def spec_files
    glob("spec/**/*_spec.rb")
  end

  def test_files
    glob("test/**/*_test.rb")
  end

  def model_files
    glob("app/models/*.rb")
  end

  def glob(pattern)
    Dir.glob(root.join(pattern)).map { |f| Pathname.new(f).expand_path }
  end

  class Pathnames < Array
  end
end
