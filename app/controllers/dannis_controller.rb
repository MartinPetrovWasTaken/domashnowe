class DannisController < ApplicationController
  before_action :set_danni, only: [:show, :edit, :update, :destroy]

  # GET /dannis
  # GET /dannis.json
  def index
    @dannis = Danni.all
  end

  # GET /dannis/1
  # GET /dannis/1.json
  def show
  end

  # GET /dannis/new
  def new
    @danni = Danni.new
  end

  # GET /dannis/1/edit
  def edit
  end

  # POST /dannis
  # POST /dannis.json
  def create
    @danni = Danni.new(danni_params)

    respond_to do |format|
      if @danni.save
        format.html { redirect_to @danni, notice: 'Danni was successfully created.' }
        format.json { render :show, status: :created, location: @danni }
      else
        format.html { render :new }
        format.json { render json: @danni.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dannis/1
  # PATCH/PUT /dannis/1.json
  def update
    respond_to do |format|
      if @danni.update(danni_params)
        format.html { redirect_to @danni, notice: 'Danni was successfully updated.' }
        format.json { render :show, status: :ok, location: @danni }
      else
        format.html { render :edit }
        format.json { render json: @danni.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dannis/1
  # DELETE /dannis/1.json
  def destroy
    @danni.destroy
    respond_to do |format|
      format.html { redirect_to dannis_url, notice: 'Danni was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_danni
      @danni = Danni.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def danni_params
      params.require(:danni).permit(:nomer, :text)
    end
end
