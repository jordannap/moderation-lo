class ModeratedModelsController < ApplicationController
  before_action :set_moderated_model, only: %i[ show edit update destroy ]

  def index
    @moderated_models = ModeratedModel.all.order("created_at ASC")
  end

  def show
  end

  def new
    @moderated_model = ModeratedModel.new
  end

  def edit
  end

  def create
    @moderated_model = ModeratedModel.new(moderated_model_params)

    if @moderated_model.save!
      redirect_to moderated_models_path(@moderated_model)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @moderated_model.update(moderated_model_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @moderated_model.destroy
    redirect_to moderated_models_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_moderated_model
    @moderated_model = ModeratedModel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def moderated_model_params
    params.require(:moderated_model).permit(:content)
  end
end
