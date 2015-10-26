class AddBodyTranslationToTranslations < ActiveRecord::Migration
  def change
    add_column :translations, :body_translation, :text
  end
end
