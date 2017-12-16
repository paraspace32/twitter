class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :comment
      t.references :tweet, index: true

      t.timestamps
    end
  end
end
