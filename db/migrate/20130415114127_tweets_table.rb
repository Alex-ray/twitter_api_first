class TweetsTable < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :text
      t.references :twitteruser
      t.time :created_at
    end
  end
end
