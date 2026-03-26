require "csv"

Tree.destroy_all
Site.destroy_all
Neighbourhood.destroy_all

csv_path = Rails.root.join("db", "tree_inventory.csv")

CSV.foreach(csv_path, headers: true, encoding: "bom|utf-8") do |row|
  neighbourhood_name = row["Neighbourhood"]&.strip
  electoral_ward = row["Electoral Ward"]&.strip

  next if neighbourhood_name.blank? || electoral_ward.blank?

  neighbourhood = Neighbourhood.find_or_create_by!(
    name: neighbourhood_name,
    electoral_ward: electoral_ward
  )

  site = Site.find_or_create_by!(
    park: row["Park"]&.strip,
    location_class: row["Location Class"]&.strip,
    property_type: row["Property Type"]&.strip,
    street: row["Street"]&.strip,
    street_from: row["Street From"]&.strip,
    street_to: row["Street To"]&.strip,
    x_coord: row["X"]&.to_s&.gsub(",", "")&.to_f,
    y_coord: row["Y"]&.to_s&.gsub(",", "")&.to_f,
    point: row["Point"]&.strip,
    neighbourhood: neighbourhood
  )

  Tree.find_or_create_by!(
    tree_id_external: row["Tree ID"].to_i
  ) do |tree|
    tree.botanical_name = row["Botanical Name"]&.strip
    tree.common_name = row["Common Name"]&.strip
    tree.diameter_at_breast_height = row["Diameter at Breast Height"]&.to_i
    tree.ded_tag_number = row["DED Tag Number"]&.strip
    tree.site = site
  end
end

puts "Neighbourhoods: #{Neighbourhood.count}"
puts "Sites: #{Site.count}"
puts "Trees: #{Tree.count}"
puts "Total rows: #{Neighbourhood.count + Site.count + Tree.count}"
