require "rails_helper"

RSpec.describe Task do
  describe "validations" do
    context "title" do
      context "with missing title" do
        let(:task) do
          FactoryBot.build(
            :task,
            title: nil,
          )
        end

        it "is not valid" do
          expect(task).not_to be_valid
        end
      end

      context "with present title" do
        let(:task) do
          FactoryBot.build(
            :task,
            title: "call the doctor",
          )
        end

        it "is valid" do
          expect(task).to be_valid
        end
      end
    end

    context "effort_level" do
      context "with missing effort_level" do
        let(:task) do
          FactoryBot.build(
            :task,
            effort_level: nil,
          )
        end

        it "is not valid" do
          expect(task).not_to be_valid
        end
      end

      context "when effort level is included in EFFORT_LEVELS" do
        described_class::EFFORT_LEVELS.each do |level|
          context "when the effort level is #{level}" do
            let(:task) do
              FactoryBot.build(
                :task,
                effort_level: level,
              )
            end

            it "is valid" do
              expect(task).to be_valid
            end
          end
        end
      end

      context "when effort level is not included in EFFORT_LEVELS" do
        let(:task) do
          FactoryBot.build(
            :task,
            effort_level: 5,
          )
        end

        it "is not valid" do
          expect(task).not_to be_valid
        end
      end
    end
  end
end