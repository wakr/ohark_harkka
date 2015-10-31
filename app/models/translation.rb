class Translation < ActiveRecord::Base

  POSSIBLE_LANGUAGES = ['fi', 'en', 'sv']


  def self.translate(request)
    return ::TranslatorApi.translate(request)[0]
  end

end
