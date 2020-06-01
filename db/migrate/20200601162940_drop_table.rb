class DropTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :flats_reviews
    drop_table :flat_reviews
  end
end
