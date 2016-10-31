require 'rails_helper'

RSpec.describe Author, type: :model do
  context "with Alan Turing as author" do
    it "the name method returns his full name" do
      author = create(:author)

      expect(author.name).to eq("Alan Turing")
    end
  end
  context "with no authors" do
    it "requires first and last name" do
      author = Author.new
      expect {
        author.save!
      }.to raise_error(ActiveRecord::RecordInvalid)

      author = Author.new(:first_name => "Alan")
      expect {
        author.save!
      }.to raise_error(ActiveRecord::RecordInvalid)

      author = Author.new(:last_name => "Turing")
      expect {
        author.save!
      }.to raise_error(ActiveRecord::RecordInvalid)

      author = Author.new(:first_name => "Alan", :last_name => "Turing")
      expect {
        author.save!
      }.to_not raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
