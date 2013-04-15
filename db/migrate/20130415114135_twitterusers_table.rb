class TwitterusersTable < ActiveRecord::Migration
  def change
    create_table :twitterusers do |t|
      t.string :user_name
      t.datetime :last_saved
    end
  end
end
