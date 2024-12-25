class BandsController < ApplicationController
  before_action :set_band, only: %i[show edit update destroy]


  def index
    @bands = Band.all
    @band = Band.new
  end

  def show; end

  def new
    @band = Band.new
  end

  def edit; end

  def create
    @band = Band.new(band_params)
    respond_to do |format|
      if @band.save
        format.html { redirect_to bands_path, notice: "Band was successfully created." }
        format.json { render :show, status: :created, location: @band }
      else
        Rails.logger.error(@band.errors.full_messages)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @band.update(band_params)
        format.html { redirect_to band_path(@band), notice: "Band was successfully updated." }
        format.json { render :show, status: :ok, location: @band }
      else
        Rails.logger.error(@band.errors.full_messages)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @band.destroy
    respond_to do |format|
      format.html { redirect_to bands_path, status: :see_other, notice: "Band was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :address,)
  end
end
