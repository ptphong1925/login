class SubcommentsController < ApplicationController
  before_action :set_subcomment, only: %i[ show edit update destroy ]

  # GET /subcomments or /subcomments.json
  def index
    @subcomments = Subcomment.all
  end

  # GET /subcomments/1 or /subcomments/1.json
  def show
  end

  # GET /subcomments/new
  def new
    @subcomment = Subcomment.new
  end

  # GET /subcomments/1/edit
  def edit
  end

  # POST /subcomments or /subcomments.json
  def create
    @subcomment = Subcomment.new(subcomment_params)

    respond_to do |format|
      if @subcomment.save
        format.html { redirect_to subcomment_url(@subcomment), notice: "Subcomment was successfully created." }
        format.json { render :show, status: :created, location: @subcomment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcomments/1 or /subcomments/1.json
  def update
    respond_to do |format|
      if @subcomment.update(subcomment_params)
        format.html { redirect_to subcomment_url(@subcomment), notice: "Subcomment was successfully updated." }
        format.json { render :show, status: :ok, location: @subcomment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcomments/1 or /subcomments/1.json
  def destroy
    @subcomment.destroy

    respond_to do |format|
      format.html { redirect_to subcomments_url, notice: "Subcomment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcomment
      @subcomment = Subcomment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subcomment_params
      params.require(:subcomment).permit(:content, :status, :subcommenter_id, :subcommenter_type, :comment_id, :likes_count)
    end
end
