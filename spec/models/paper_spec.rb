require 'rails_helper'

RSpec.describe Paper, type: :model do
  context "with no papers" do
    it "requires title, venue, year" do
      paper = Paper.new
      expect {
        paper.save!
      }.to raise_error(ActiveRecord::RecordInvalid)

      paper = Paper.new(:title => "My Paper", :venue => "HPI")
      expect {
        paper.save!
      }.to raise_error(ActiveRecord::RecordInvalid)

      paper = Paper.new(:title => "My Paper", :year => 2016)
      expect {
        paper.save!
      }.to raise_error(ActiveRecord::RecordInvalid)

      paper = Paper.new(:venue => "HPI", :year => 2016)
      expect {
        paper.save!
      }.to raise_error(ActiveRecord::RecordInvalid)

      paper = Paper.new(:title => "My Paper", :venue => "HPI", :year => 2016)
      expect {
        paper.save!
      }.to_not raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
