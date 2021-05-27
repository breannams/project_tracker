class ProjectsController < ApplicationController
    before_action :require_log_in
    before_action :set_project, only:[:show, :edit, :update, :destroy]

    def index
        @project = Project.all
    end

    def new
        @project = Project.new
    end

    def create 
        @project = current_user.projects.build(project_params)
        if @project.save
            redirect_to projects_path
        else
            render :new
        end
    end

    def show

    end

    def create
    end

    def edit
    end
    
    def update
    end

    def destroy
    end


    private
    
    def set_project
        @project = Project.find_by_id(params[:id])
    end

    def project_params
        params.require(:project).permit(:title, :description, :categories_id)
    end
end
