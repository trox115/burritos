class BurritosInfoController < ApplicationController
  before_action :set_api_service
  before_action :set_burrito_info
  include BurritosInfoHelper

  def index
    @platform_a = @api_service.platform('a')
    @platform_b = @api_service.platform('b')
    @platform_c = @api_service.platform('c')
    @db_info = BurritosInfo.first
    stack
  end

  def edit; end

  def create
    @burritos_info = BurritosInfo.new(eval(params['info'])) # rubocop:todo Security/Eval
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
          # rubocop:todo Style/CaseEquality
          add_to_queue(burrito_info_params) if @api_service.update(x, burrito_info_params) === 0
          # rubocop:enable Style/CaseEquality
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
