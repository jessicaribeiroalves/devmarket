class ProjectsController < ApplicationController

  def index
      @projects = Project.all
    
  end

  def create
    @project = Project.new(project_params)
    @project.save

    # redirect_to @projects
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])

  end



end
