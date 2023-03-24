require "rails_helper"

RSpec.describe "date_formats" do
  describe "default_display" do
    it "formats the date as expected" do
      expect(DateTime.new(2023, 2, 14, 9, 15, 0).to_s(:default_display)).to eq(" 9:15am 02/14/23")
    end
  end

  describe "input_display" do
    it "formats the date as expected" do
      expect(DateTime.new(2023, 2, 14, 9, 15, 0).to_s(:input_display)).to eq("2023-02-14T 9:15")
    end
  end
end