require 'spec_helper'

describe RailsInspector do
  it 'has a version number' do
    expect(RailsInspector::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(RailsInspector).to be_a(Class)
  end

  describe "a RailsInspector on our dummy application" do
    let(:dummy) { "spec/dummy" }
    let(:appdir) { dummy }
    let(:inspector) { described_class.new(appdir) }
    let(:subject) { inspector }
    let(:basenames) { files.map(&:basename).map(&:to_s) }
    let(:classnames) { files.map(&:class_name) }
    let(:files) { double }
    
    it { is_expected.to respond_to(:root) }

    describe "#root" do
      it "is absolute" do
        expanded = File.expand_path(dummy)
        expect(subject.root.to_s).to eq(expanded)
      end
      it "can be subbed" do
        expect(subject.root.sub('dummy', 'gyx').to_s).to match(%r{spec/gyx})
      end
    end

    it { is_expected.to respond_to(:files) }

    describe "#files" do
      let(:files) { subject.files }
      it "contains all key files" do
        expect(basenames).to include("application_controller.rb")
        expect(basenames).to include("application_helper.rb")
      end
    end

    it { is_expected.to respond_to(:model_files) }

    describe "#model_files" do
      let(:files) { subject.model_files }
      it "contains model files" do
        expect(basenames).to include("user.rb")
      end
      describe "a model file" do
        let(:file) { files.first }
        it "can tell us its class name" do
          expect(classnames).to include("User")
        end
      end
    end

    describe "#controller_files" do
      let(:files) { subject.controller_files }
      it "contains controller files" do
        expect(basenames).to include("users_controller.rb")
      end
      describe "a controller file" do
        let(:file) { files.first }
        it "can tell us its class name" do
          expect(classnames).to include("UsersController")
        end
      end
    end
  end
end
