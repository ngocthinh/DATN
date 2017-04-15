class CreateTechniques < ActiveRecord::Migration[5.0]
  def change
    create_table :techniques do |t|
      t.string :skill
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
