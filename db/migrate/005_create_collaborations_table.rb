class CreateCollaborationsTable < ActiveRecord::Migration[5.0]

    def change
        create_table :collaborations do |t|
            t.integer :artist_id
            t.integer :exhibition_id
        end
    end

end