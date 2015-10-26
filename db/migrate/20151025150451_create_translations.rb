class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :language_from
      t.string :language_to
      t.text :body_text

      t.timestamps null: false
    end
  end
end
