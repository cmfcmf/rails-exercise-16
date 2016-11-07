class Author < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :papers

  def name
    self.first_name + " " + self.last_name
  end
end
