class TranslationsController < ApplicationController
  before_action :set_translation, only: [:show]

  def index
    @languages = Translation::POSSIBLE_LANGUAGES
    @translations = Translation.all
  end

  def create

    @translation = Translation.new(translation_params)

    if Translation.all.exists?(:body_text => @translation.body_text, :language_from => @translation.language_from, :language_to => @translation.language_to)
      found = Translation.find_by(body_text: @translation.body_text, language_from: @translation.language_from, language_to: @translation.language_to)
      redirect_to found
      return
    end

    @translation.body_translation = Translation.translate(@translation)

    if @translation.save
      params['translation_id'] = @translation.id
      redirect_to @translation
    else
      redirect_to :root, :alert => 'ERROR!'
    end
  end

  def show

  end

  def all
    @translations = Translation.all
  end



  def translation_params
    params.require(:translation).permit(:language_from, :language_to, :body_text)
  end

  def set_translation
    @translation = Translation.find(params[:id])
  end

  end
