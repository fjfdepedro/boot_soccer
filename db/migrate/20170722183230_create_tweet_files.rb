class CreateTweetFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :tweet_files do |t|
      t.string :text
      t.datetime :date
      t.string :coordinates

      t.timestamps
    end
  end
end
