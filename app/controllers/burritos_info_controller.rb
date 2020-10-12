class BurritosInfoController < ApplicationController
  before_action :set_api_service
  before_action :set_burrito_info
  include BurritosInfoHelper

  def index
    @platform_a = @api_service.platform('a')
    @platform_b = @api_service.platform('b')
    @platform_c = @api_service.platform('c')
    @db_info = BurritosInfo.first
  end

  def edit
    # @burritos = BurritosInfo.first
  end

  def create
    @burritos_info = BurritosInfo.new(eval(params['info']))
    respond_to do |format|
      if @burritos_info.save!
        format.html { redirect_to '/', notice: 'Burrito info was successfully created.' }
        format.json { render :index, status: :created, location: @burrito_info }
      else
        format.html { render :edit }
        format.json { render json: @burritos_info.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    platforms = %w[a b c]
    respond_to do |format|
      if @burritos.update(burrito_info_params)
        platforms.each do |x|
          @api_service.update(x, burrito_info_params)
        end
        format.html { redirect_to '/', notice: 'Burrito info was successfully updated.' }
        format.json { render :show, status: :ok, location: @burrito_info }

      else
        format.html { render :edit }
        format.json { render json: @burrito_info.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_burrito_info
    @burritos = BurritosInfo.first
  end

  def set_api_service
    @api_service = GlobalApi.new
  end

  def burrito_info_params
    params.require(:burritos_info).permit(:name, :address, :address_line_2, :lat, :lng, :category_id, :category_id2,
                                          :phone_number, :website, :closed, :hours)
  end
end
