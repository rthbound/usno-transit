require "test_helper"

describe USNO::Transit::Sun do
  before do
    @subject = USNO::Transit::Sun.new
  end

  describe "calling for data" do
    it "will raise without location data" do
      -> { @subject.call }.must_raise RuntimeError
    end
  end
end
