class CreateExhibitions < ActiveRecord::Migration[5.0]

    def change
        create_table :exhibitions do |t|
            t.string :name
            t.datetime :date
            t.string :location
            t.datetime :time
            t.integer  :curator_id
            t.integer :style_id
            t.integer :collaborator_id

        end
    end
end
