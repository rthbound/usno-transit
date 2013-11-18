require "test_helper"

describe USNO::Transit::View do
  it "cannot be instantiated directly" do
    -> { USNO::Transit::View.new }.must_raise RuntimeError
  end
end
