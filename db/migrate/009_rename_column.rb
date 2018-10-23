class RenameColumn < ActiveRecord::Migration[5.0]

    def change
        rename_column :exhibitions, :collaborator_id, :collaboration_id
    end


end