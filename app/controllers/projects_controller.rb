class ProjectsController < ApplicationController

  # Authenticate user before accessing website

  before_action :authenticate_user!, :except => [@projects, :index, :show]
  
  # Show all projects

  def index
      @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.save    
  end
  

  def new
    @project = Project.new
    @products = Product.all
  end

  # Show single project

  def show
    @project = Project.find(params[:id])
    @bid = Bid.new
  end

end
