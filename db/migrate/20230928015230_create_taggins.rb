class CreateTaggins < ActiveRecord::Migration[7.0]
  def change
    create_table :taggins do |t|
      t.references :tweet, null: false, foreign_key: true
      t.references :hastag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
