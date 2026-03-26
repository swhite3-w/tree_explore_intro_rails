class NeighbourhoodsController < ApplicationController
  def index
    @neighbourhoods = Neighbourhood.order(:name)
  end

  def show
    @neighbourhood = Neighbourhood.includes(sites: :trees).find(params[:id])
  end
end
