class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.integer :collage_id
      t.timestamps
    end
  end
end
