require "rails_helper"

RSpec.describe TasksHelper do
  describe "#handle_effort_level" do
    subject { handle_effort_level(effort_level) }

    context "when the effort level is 1" do
      let(:effort_level) { 1 }
      let(:expected) do
        "<i class=\"fa-solid fa-spoon green\"></i>"
      end

      it "returns the expected html" do
        expect(subject).to eq(expected)
      end
    end

    context "when the effort level is 2" do
      let(:effort_level) { 2 }
      let(:expected) do
        "<i class=\"fa-solid fa-spoon blue\"></i>"+
        "<i class=\"fa-solid fa-spoon blue\"></i>"
      end

      it "returns the expected html" do
        expect(subject).to eq(expected)
      end
    end

    context "when the effort level is 3" do
      let(:effort_level) { 3 }
      let(:expected) do
        "<i class=\"fa-solid fa-spoon pink\"></i>"+
        "<i class=\"fa-solid fa-spoon pink\"></i>"+
        "<i class=\"fa-solid fa-spoon pink\"></i>"
      end

      it "returns the expected html" do
        expect(subject).to eq(expected)
      end
    end
  end
end