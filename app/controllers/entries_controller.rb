class EntriesController < ApplicationController
    before_action :require_log_in
    before_action :set_entry, only:[:edit, :update, :destroy]
    
    def new
        @entry = Entry.new
    end

    def create
        @entry = current_user.entries.create(entry_params)
        if @entry.save
            redirect_to :controller => "projects", :action => "index"
        else
            render :new
        end
    end

    def edit

    end


    private
    
    def set_entry
        @entry = Entry.find_by_id(params[:id])
    end

    def entry_params
        params.require(:entry).permit(:notes, :project_id)
    end
end
