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

end # describe Hexx::Settings
