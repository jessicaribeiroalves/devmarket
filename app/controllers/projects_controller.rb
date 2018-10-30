class ProjectsController < ApplicationController

  def index
  end

  def create
    @projects = Project.new(project_params)
    @projects.save

    # redirect_to @projects
  end

  def new
    @projects = Project.new
  end

end
