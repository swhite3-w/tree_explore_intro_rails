class NeighbourhoodsController < ApplicationController
  def index
    @neighbourhoods = Neighbourhood.order(:name)
                                  .page(params[:page])
                                  .per(30)
  end

  def show
    @neighbourhood = Neighbourhood.includes(sites: :trees).find(params[:id])
  end
end