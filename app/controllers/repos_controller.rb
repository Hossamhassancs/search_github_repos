class ReposController < ApplicationController
  def index 
    @repos = Github::RepoSearchService.search(params[:search]) if params[:search] && !params[:search].empty?
  end
end
