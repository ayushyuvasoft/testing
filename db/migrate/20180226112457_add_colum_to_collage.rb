class AddColumToCollage < ActiveRecord::Migration[5.1]
  def change
    add_column :collages, :user_id, :integer
  end
end
