class SitesController < ApplicationController
  def index
    @sites = Site.includes(:neighbourhood).order(:street)
  end

  def show
    @site = Site.includes(:trees, :neighbourhood).find(params[:id])
  end
end
