class TranslatorApi


  def self.translate(request)

    url = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=
#{Figaro.env.translator_api_key}&text=#{ERB::Util.url_encode(request.body_text)}&lang=#{request.language_from}-#{request.language_to}"

    response = HTTParty.get "#{url}"

    return response["text"]
  end


end