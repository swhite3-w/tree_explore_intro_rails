class TreesController < ApplicationController
  def index
    @neighbourhoods = Neighbourhood.order(:name)

    @trees = Tree.includes(site: :neighbourhood)

    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @trees = @trees.where("common_name LIKE ? OR botanical_name LIKE ?", search_term, search_term)
    end

    if params[:neighbourhood_id].present?
      @trees = @trees.joins(site: :neighbourhood)
                     .where(neighbourhoods: { id: params[:neighbourhood_id] })
    end

    @trees = @trees.order(:common_name).page(params[:page]).per(25)
  end

  def show
    @tree = Tree.includes(site: :neighbourhood).find(params[:id])
  end
end