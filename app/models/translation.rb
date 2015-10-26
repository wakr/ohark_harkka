class Translation < ActiveRecord::Base

  POSSIBLE_LANGUAGES = ['fi', 'en', 'sv']

  validates :body_text, uniqueness: true


  def self.translate(request)
    return ::TranslatorApi.translate(request)
  end

end
