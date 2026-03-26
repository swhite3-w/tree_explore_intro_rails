# Winnipeg Tree Explorer

## Overview

Winnipeg Tree Explorer is a Ruby on Rails web application that allows users to explore the City of Winnipeg Tree Inventory dataset. Users can browse trees, view detailed information, and navigate between related sites and neighbourhoods.

This project demonstrates relational database design, data import from a real-world dataset, and multi-model navigation within a Rails application.

---

## Dataset

This application uses the **City of Winnipeg Tree Inventory dataset**, which includes:

* Tree species (common and botanical names)
* Tree size (diameter at breast height)
* Neighbourhood and electoral ward
* Site/location details (street, park, property type)
* Geographic coordinates

---

## Database Structure

The application uses three main tables:

### Neighbourhoods

* name
* electoral_ward

### Sites

* park
* location_class
* property_type
* street
* street_from
* street_to
* x_coord
* y_coord
* point
* neighbourhood_id

### Trees

* tree_id_external
* botanical_name
* common_name
* diameter_at_breast_height
* ded_tag_number
* site_id

### Relationships

* A neighbourhood has many sites
* A site belongs to a neighbourhood
* A site has many trees
* A tree belongs to a site

---

## Data Volume

The application contains:

* 200+ neighbourhoods
* 16,000+ sites
* 16,000+ trees

---

## Features

* View all trees with pagination
* Search trees by common or botanical name
* Filter trees by neighbourhood
* View tree details (show page)
* Navigate from trees → sites → neighbourhoods
* View all sites and neighbourhoods
* Display related data across models
* Entity Relationship Diagram included
* Bootstrap styling for layout

---

## Setup Instructions

### 1. Clone the repository

git clone https://github.com/swhite3-w/tree_explore_intro_rails.git
cd tree_explore_intro_rails

### 2. Install dependencies

bundle install

### 3. Set up the database

rails db:create
rails db:migrate

### 4. Seed the database

Ensure the dataset CSV file is located at:
db/tree_inventory.csv

Then run:
rails db:seed

### 5. Start the server

rails server

Open your browser and go to:
http://localhost:3000

---

## Technologies Used

* Ruby on Rails 7
* SQLite3
* CSV (data import)
* Kaminari (pagination)
* Bootstrap (styling)

---

## Key Concepts Demonstrated

* Relational database design
* Model associations (one-to-many relationships)
* Data seeding from CSV
* MVC architecture in Rails
* Search and filtering
* Pagination
* Multi-model navigation

---

