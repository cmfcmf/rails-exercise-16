require 'rails_helper'

RSpec.describe Author, type: :model do
  context "with Alan Turing as author" do
    it "the name method returns his full name" do
      author = create(:author)

      expect(author.name).to eq("Alan Turing")
    end
  end
end