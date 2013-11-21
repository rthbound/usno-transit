require "test_helper"
include Minitest::Assertions

describe USNO::Transit::View do
  it "cannot be instantiated directly" do
    -> { USNO::Transit::View.new }.must_raise RuntimeError
  end

  describe "being instantiated by a valid subclass" do
    before do
      @valid_subclasses = USNO::Transit::Bodies.hash.keys
    end

    it "instantiates for each valid subclass" do
      @valid_subclasses.each do |k|
        @subject = instance_eval("USNO::Transit::#{k}")

        assert_instance_of(@subject, @subject.new)

        @subject.new.must_respond_to :call, "should respond to #call"
      end
    end
  end
end
