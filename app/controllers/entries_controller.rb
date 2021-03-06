class EntriesController < ApplicationController
    before_action :set_entry, only:[:edit, :update, :destroy]

    def new
        if params[:project_id]
            @project = Project.find_by_id(params[:project_id])
            if @project
                @entry = @project.entries.build
            else
                @entry = Entry.new
            end
        end   
    end

    def create
        @entry = current_user.entries.create(entry_params)
     
        if @entry.save
            flash[:success] = "Your entry has been created!"
            redirect_to project_path(params[:entry][:project_id])
        else
            render :new
        end
    end

    def edit

    end

    def update
        if @entry.update(entry_params)
            flash[:sucess] = "Your entry has been updated"
            redirect_to project_path(params[:entry][:project_id])
         
        else
            render :edit
        end
    end


    def delete_file
        @image = ActiveStorage::Attachment.find(params[:id])
        @image.purge
        redirect_back(fallback_location: entries_path)
    end
      
   def destroy
    if @entry.present?
        @entry.destroy
        redirect_to project_path(@entry.project)
        flash[:success] = "Your entry has been deleted."
    end
   end

    private
    
    def set_entry
        @entry = Entry.find_by_id(params[:id])
    end

    def entry_params
        params.require(:entry).permit(:notes, :project_id, images: [])
    end
end
