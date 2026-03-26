class SitesController < ApplicationController
  def index
    @sites = Site.includes(:neighbourhood)
                 .order(:street)
                 .page(params[:page])
                 .per(25)
  end

  def show
    @site = Site.includes(:trees, :neighbourhood).find(params[:id])
  end
end
