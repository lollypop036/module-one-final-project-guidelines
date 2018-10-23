class CreateExhibitions < ActiveRecord::Migration[5.0]

    def change
        create_table :exhibitions do |t|
            t.string :name
            t.string :date
            t.string :location
            t.string :time
            t.integer  :curator_id
            t.integer :style_id
        end
    end
end
