class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :titre
      t.text :description
      t.references :utilisateur, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
