FactoryGirl.define do
  factory :paper do
    title "COMPUTING MACHINERY AND INTELLIGENCE"
    venue "HPI"
    year 2016

    factory :paper_with_author do
      after(:create) do |paper, evaluator|
        create_list(:author, 1, papers: [paper])
      end
    end
  end
end
