class RemoveStyleTableAndRelationships < ActiveRecord::Migration[5.0]


def change

    drop_table :styles
    remove_column :exhibitions, :style_id
    add_column :exhibitions, :style, :string
    remove_column :artists, :style_id
    add_column :artists, :style, :string
end

end