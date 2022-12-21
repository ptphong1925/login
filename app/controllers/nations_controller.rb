class NationsController < ApplicationController
  before_action :set_nation, only: %i[ show edit update destroy ]

  # GET /nations or /nations.json
  def index
    @nations = Nation.all
  end

  # GET /nations/1 or /nations/1.json
  def show
  end

  # GET /nations/new
  def new
    @nation = Nation.new
  end

  # GET /nations/1/edit
  def edit
  end

  # POST /nations or /nations.json
  def create
    @nation = Nation.new(nation_params)

    respond_to do |format|
      if @nation.save
        format.html { redirect_to nation_url(@nation), notice: "Nation was successfully created." }
        format.json { render :show, status: :created, location: @nation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nations/1 or /nations/1.json
  def update
    respond_to do |format|
      if @nation.update(nation_params)
        format.html { redirect_to nation_url(@nation), notice: "Nation was successfully updated." }
        format.json { render :show, status: :ok, location: @nation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nations/1 or /nations/1.json
  def destroy
    @nation.destroy

    respond_to do |format|
      format.html { redirect_to nations_url, notice: "Nation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nation
      @nation = Nation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nation_params
      params.require(:nation).permit(:name)
    end
end
