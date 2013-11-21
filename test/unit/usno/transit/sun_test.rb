require "test_helper"

describe USNO::Transit::Sun do
  before do
    @subject = USNO::Transit::Sun
  end

  describe "calling for data" do
    it "will raise without location dependencies" do
      -> { @subject.new.call }.must_raise RuntimeError
    end

    it "wont raise with location dependencies" do
      @subject.new(city: "Birmingham", state: "Alabama").call.must_respond_to :data
    end
  end
end
