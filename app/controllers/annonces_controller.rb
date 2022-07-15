class AnnoncesController < PermissionsController
  before_action :authenticate_user!
  before_action :only_admin, only: %i[create update destroy]

  def index
    annonces = Annonce.all
    render json: { annonces: annonces }
  end

  def show
    annonce = Annonce.find(params[:id])
    render json: { annonce: annonce }
  end

  def create
    annonce = Annonce.new(annonce_params)
    if annonce.save
      render json: { status: true, message: "Annonce created" }
    else
      render json: { error: annonce.errors.full_messages }
    end
  end

  def update
    annonce = Annonce.find(params[:id])
    if annonce.update(annonce_params)
      render json: { annonce: annonce }
    else
      render json: { error: annonce.errors.full_messages }
    end
  end

  def destroy
    annonce = Annonce.find(params[:id])
    annonce.destroy
    render json: { message: "Annonce deleted" }
  end

  private

  def annonce_params
    params.permit(:message)
  end
end
