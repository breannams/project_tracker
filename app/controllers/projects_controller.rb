class ProjectsController < ApplicationController
    before_action :require_log_in
    before_action :set_project, only:[:show, :edit, :update, :destroy]

    def index
        if params[:user_id]
          @user =  User.find_by_id(params[:user_id])
            if @user
             @projects = @user.projects
            else
                flash[:message] = "That user doesn't exist."
                @projects = Project.all
            end
        else
            @projects = Project.all
        end
    end

    def new
        @project = Project.new
        @categories = Category.all
    end

    def create 
        @project = current_user.projects.build(project_params)
     
        if @project.save
            redirect_to user_projects_path(current_user)
            flash[:success] = "Your new project has been created!"
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
        if @project.update(project_params)
            redirect_to project_path(@project)
            flash[:success] = "Your project has been updated."
        else
            render :edit
        end
    end

    def destroy
        if @project.present?
            @project.destroy
            redirect_to projects_path
            flash[:success] = "Your project has been deleted."
        end
       end
    
    def collaboration
        @projects = Project.collaboration
    end

    private
    
    def set_project
        @project = Project.find_by_id(params[:id])
        if !@project
            flash[:message] = "Project was not found."
            redirect_to root_path
        end
    end

    def project_params
        params.require(:project).permit(:title, :description, :collaboration, :public, category_ids: [], categories_attributes: [:name])
    end
end
