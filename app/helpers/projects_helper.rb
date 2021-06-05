module ProjectsHelper
    def empty_project_message
        if @projects.empty? 
            tag.h2(link_to("There are no projects yet! Create one here", new_project_path) )
        end
    end

    def number_of_entries(project)
        "Number of Entries: #{project.entries.count}"
    end
   
    def created_on(project)
        "Created on: #{ project.created_at.strftime("%m/%e/%Y %l:%M %p")}"
    end

    def last_updated(project)
        "Last updated on:#{ project.updated_at.strftime("%m/%e/%Y %l:%M %p") }"
    end

    def collaborations(project)
        "This is a collaboration project! Lets work on it together! :)" if project.collaboration
    end 

    def collab_warning(project)
        if project.user != current_user
         "This is a collaboration project! Please note that the original creator can edit or delete any entries that are added by other users." if @project.collaboration 
        end
    end
   
    def has_a_category(project)
        if @project.categories.any?
            tag.h4("Categories:")
        @project.categories.each do |category|
            link_to(category.name, category)
            end
        end
    end




end