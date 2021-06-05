module EntriesHelper
    def entry_created_by(entry)
        "Entry Created by: #{entry.user.username}"
    end

    def can_add_entry(project)
        if @project.user == current_user || @project.collaboration
            link_to( "Add a new entry", new_project_entry_path(@project) )
        end
    end

    def can_delete_entry(entry)
        link_to( "Delete Entry", entry, method: :delete) if current_user == entry.user || current_user == @project.user
 
    end

    def can_edit_entry(entry)
        link_to("Edit Entry", edit_entry_path(entry)) if current_user == entry.user || current_user == @project.user
    end
    
end