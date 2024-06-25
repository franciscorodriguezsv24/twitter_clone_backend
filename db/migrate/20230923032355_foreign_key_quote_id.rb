class ForeignKeyQuoteId < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :tweets, :tweets, column: :quote_id 
  end
end
