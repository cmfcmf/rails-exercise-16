class Paper < ActiveRecord::Base
  validates :title, presence: true
  validates :venue, presence: true
  validates :year, presence: true

  belongs_to :author
end
