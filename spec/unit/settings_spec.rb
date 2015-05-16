# encoding: utf-8

describe Hexx::Settings do

  let(:klass) do
    Class.new(described_class) do
      attr_accessor :foo, :bar
      private :bar
    end
  end

  subject(:instance) { klass.instance }

  describe ".instance" do

    it "creates a singleton object" do
      expect(subject).to be_kind_of Singleton
    end

  end # .instance

  describe ".configure" do

    it "yields block with instance" do
      result = klass.configure { |config| config }
      expect(result).to eq instance
    end

    it "doesn't fail when no block given" do
      expect { klass.configure }.not_to raise_error
    end

  end # .configure

  describe "[]" do

    context "with the name of public instance method" do

      subject { klass[:foo] }

      it "returns value of the instance attribute" do
        instance.foo = :qux
        expect(subject).to eq :qux
      end

    end # context

    context "with the name of private instance method" do

      subject { klass[:bar] }

      it "raises NoMethodError" do
        expect { subject }.to raise_error NoMethodError
      end

    end # context

    context "with the name of unexisting instance method" do

      subject { klass[:baz] }

      it "raises NoMethodError" do
        expect { subject }.to raise_error NoMethodError
      end

    end # context

    context "without the argument" do

      subject { klass[] }

      it "raises ArgumentError" do
        expect { subject }.to raise_error ArgumentError
      end

    end # context

  end # describe []

  describe ".initialize_from" do

    before { $stderr = StringIO.new }
    after  { $stderr = STDERR       }

    context "with unexisting path to intializers" do

      subject { klass.initialize_from "baz", at: "foo/bar" }

      it "tries to load the initializer" do
        expect(klass).to receive(:require).with "foo/bar/baz"
        subject
      end

      it "doesn't fail" do
        expect { subject }.not_to raise_error
      end

      it "issues a warning" do
        expect { subject }
          .to change { $stderr.string }
          .to "You should provide the 'baz.rb' initializer\n"
      end

    end # context

    context "when file has an extension" do

      subject { klass.initialize_from "baz.rb", at: "foo/bar" }

      it "issues a proper warning" do
        expect { subject }
          .to change { $stderr.string }
          .to "You should provide the 'baz.rb' initializer\n"
      end

    end # context

    context "without path to initializers" do

      subject { klass.initialize_from "baz" }

      it "doesn't fail" do
        expect { subject }.not_to raise_error
      end

      it "issues a warning" do
        expect { subject }
          .to change { $stderr.string }
          .to "You should provide the path to initializers\n"
      end

    end # context

  end # describe .initialize_from

  describe ".reset" do

    before  { instance.foo = "foo" }
    subject { klass.reset         }

    it "resets settings" do
      expect { subject }.to change { klass[:foo] }.from("foo").to nil
    end

  end # describe .reset

end # describe Hexx::Settings
