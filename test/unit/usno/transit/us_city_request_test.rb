require 'test_helper'

describe Usno::Transit::UsCityRequest do
  before do
    @subject = Usno::Transit::UsCityRequest
    @params = {
      city: MiniTest::Mock.new,
      state: MiniTest::Mock.new,
      count: MiniTest::Mock.new,
      date: MiniTest::Mock.new,
      z_meters: MiniTest::Mock.new,
    }
  end

  describe "as a class" do
    it "initializes properly" do
      @subject.new(@params).must_respond_to :call
    end

    it "errors when initialized without required dependencies" do
      -> { @subject.new(@params.reject { |k| k.to_s == 'city' }) }.must_raise RuntimeError
      -> { @subject.new(@params.reject { |k| k.to_s == 'state' }) }.must_raise RuntimeError
    end
  end

  describe "as an instance" do
    it "executes successfully" do
      result = @subject.new(@params).call
      result.successful?.must_equal true
      result.must_be_kind_of PayDirt::Result
    end
  end
end