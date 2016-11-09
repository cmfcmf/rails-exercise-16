class FixAssociation < ActiveRecord::Migration
  def change
    create_join_table :authors, :papers
  end
end
