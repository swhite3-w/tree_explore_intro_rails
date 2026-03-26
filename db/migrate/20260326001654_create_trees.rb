class CreateTrees < ActiveRecord::Migration[7.2]
  def change
    create_table :trees do |t|
      t.integer :tree_id_external
      t.string :botanical_name
      t.string :common_name
      t.integer :diameter_at_breast_height
      t.string :ded_tag_number
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
