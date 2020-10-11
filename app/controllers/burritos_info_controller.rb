class BurritosInfoController < ApplicationController
  before_action :set_api_service

  def index
    @platform_a = @api_service.platform('a')
    @platform_b = @api_service.platform('b')
    @platform_c = @api_service.platform('c')
    @db_info = BurritosInfo.first
  end

  def edit
  end

  private

  def set_api_service
    @api_service = GlobalApi.new
  end
end
