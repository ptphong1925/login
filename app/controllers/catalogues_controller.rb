class CataloguesController < ApplicationController
  before_action :authenticate_user!, except: :new
  before_action :set_catalogue, only: %i[ show edit update destroy ]

  before_action(only: [:show, :edit, :update, :destroy]) { authorize @catalogue }
  after_action(only: [:index]) { authorize @catalogues }
  after_action(only: [:new, :create]) { authorize @catalogue }
  # GET /catalogues or /catalogues.json
  def index
    @catalogues = Catalogue.all
  end

  # GET /catalogues/1 or /catalogues/1.json
  def show
  end

  # GET /catalogues/new
  def new
    @catalogue = Catalogue.new
  end

  # GET /catalogues/1/edit
  def edit
  end

  # POST /catalogues or /catalogues.json
  def create
    @catalogue = Catalogue.new(catalogue_params)

    respond_to do |format|
      if @catalogue.save
        format.html { redirect_to catalogue_url(@catalogue), notice: "Catalogue was successfully created." }
        format.json { render :show, status: :created, location: @catalogue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @catalogue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogues/1 or /catalogues/1.json
  def update
    respond_to do |format|
      if @catalogue.update(catalogue_params)
        format.html { redirect_to catalogue_url(@catalogue), notice: "Catalogue was successfully updated." }
        format.json { render :show, status: :ok, location: @catalogue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @catalogue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogues/1 or /catalogues/1.json
  def destroy
    @catalogue.destroy

    respond_to do |format|
      format.html { redirect_to catalogues_url, notice: "Catalogue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalogue
      @catalogue = Catalogue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def catalogue_params
      params.require(:catalogue).permit(:name, :type)
    end
end
