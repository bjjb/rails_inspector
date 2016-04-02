$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rails_inspector'
RSpec.configure do |config|
  config.before(:suite) do
    #system "rails new -BG dummy"
  end

  config.after(:suite) do
    #system "rm -rf dummy"
  end
end
