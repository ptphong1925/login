class ViolationsController < ApplicationController
  before_action :set_violation, only: %i[ show edit update destroy ]

  # GET /violations or /violations.json
  def index
    @violations = Violation.all
  end

  # GET /violations/1 or /violations/1.json
  def show
  end

  # GET /violations/new
  def new
    @violation = Violation.new
  end

  # GET /violations/1/edit
  def edit
  end

  # POST /violations or /violations.json
  def create
    @violation = Violation.new(violation_params)

    respond_to do |format|
      if @violation.save
        format.html { redirect_to violation_url(@violation), notice: "Violation was successfully created." }
        format.json { render :show, status: :created, location: @violation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @violation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /violations/1 or /violations/1.json
  def update
    respond_to do |format|
      if @violation.update(violation_params)
        format.html { redirect_to violation_url(@violation), notice: "Violation was successfully updated." }
        format.json { render :show, status: :ok, location: @violation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @violation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /violations/1 or /violations/1.json
  def destroy
    @violation.destroy

    respond_to do |format|
      format.html { redirect_to violations_url, notice: "Violation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_violation
      @violation = Violation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def violation_params
      params.require(:violation).permit(:name)
    end
end
