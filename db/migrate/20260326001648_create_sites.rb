class CreateSites < ActiveRecord::Migration[7.2]
  def change
    create_table :sites do |t|
      t.string :park
      t.string :location_class
      t.string :property_type
      t.string :street
      t.string :street_from
      t.string :street_to
      t.decimal :x_coord
      t.decimal :y_coord
      t.string :point
      t.references :neighbourhood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
