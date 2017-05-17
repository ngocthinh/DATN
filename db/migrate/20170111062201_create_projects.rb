class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :url
      t.text :description
      t.string :core_features
      t.text :realease_note
      t.string :git_repository
      t.string :platform
      t.references :category, foreign_key: true
      t.string :private_attributes, default: ""
      t.boolean :is_suggest
      t.integer :branch

      t.timestamps
    end
  end
end
