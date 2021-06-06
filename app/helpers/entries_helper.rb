module EntriesHelper

    def can_add_entry(project)
        link_to( "Add a new entry", new_project_entry_path(@project) ) if @project.user == current_user || @project.collaboration
    end

    def can_delete_entry(entry)
        link_to( "Delete Entry", entry, method: :delete,  data: {confirm: 'Are you sure?'}) if current_user == entry.user || current_user == @project.user
 
    end

    def can_edit_entry(entry)
        link_to("Edit Entry", edit_entry_path(entry)) if current_user == entry.user || current_user == @project.user
    end
    
end