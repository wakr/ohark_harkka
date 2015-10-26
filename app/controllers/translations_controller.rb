class TranslationsController < ApplicationController
  before_action :set_translation, only: :index


  def index
    @languages = Translation::POSSIBLE_LANGUAGES
    byebug
  end

  def create

    @translation = Translation.new(translation_params)
    @translation.body_translation = Translation.translate(@translation)

    if @translation.save
      params['translation_id'] = @translation.id
      redirect_to :root, notice: 'Translation successful'
    else
      print("fail")
    end
  end

  def translation_params()
    params.require(:translation).permit(:language_from, :language_to, :body_text)
  end

  def set_translation
    if Translation.exists?(params['translation_id'])
      @translated = Translation.all.find(params['translation_id'])
    end
  end

  end
