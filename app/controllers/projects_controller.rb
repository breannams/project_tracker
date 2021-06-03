class ProjectsController < ApplicationController
    before_action :require_log_in
    before_action :set_project, only:[:show, :edit, :update, :destroy]

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
        @categories = Category.all
    end

    def create 
        @project = Project.create(project_params)
     
        if @project.save
            redirect_to projects_path
        else
            render :new
        end
    end

    def all
        @projects = Project.all
    end

    def show
    end

    def edit
    end
    
    def update
        @project.update(project_params)
        if @project.update(project_params)
            redirect_to projects_path
        else
            render :edit
        end
    end

    # def destroy
    # end


    private
    
    def set_project
        @project = Project.find_by_id(params[:id])
    end

    def project_params
        params.require(:project).permit(:title, :description, :collaboration, category_ids:[], categories_attributes: [:name])
    end
end
