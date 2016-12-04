class AddMainforumRefToTopics < ActiveRecord::Migration[5.0]
  def change
    add_reference :topics, :mainforum, foreign_key: true
  end
end
