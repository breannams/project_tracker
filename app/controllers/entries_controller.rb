class EntriesController < ApplicationController
    before_action :require_log_in
    before_action :set_entry, only:[:edit, :update, :destroy]

    def new
        @entry = Entry.new
    end

    def create
        @entry = current_user.entries.create(entry_params)
     
        if @entry.save
            redirect_to project_path(params[:entry][:project_id])
            flash[:sucess] = "Your entry has been created!"
        else
            flash.now[:message] = "Please do not leave notes section blank."
            render :new
        end
    end

    def edit

    end

    def update
        
        @entry.update(entry_params)
        if @entry.update(entry_params)
            redirect_to project_path(params[:entry][:project_id])
            flash[:sucess] = "Your entry has been updated"
        else
            flash[:message] = "Your notes section cannot be blank."
            render :edit
        end
    end


    def delete_file
        file = ActiveStorage::Attachment.find(params[:id])
        file.purge
        redirect_back(fallback_location: entries_path)
    end
      
   def destroy
    if @entry.present?
        @entry.destroy
        redirect_to projects_path
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
