json.array!(@translations) do |translation|
  json.extract! translation, :id,:created_at, :language_from, :language_to, :body_text, :body_translation
end