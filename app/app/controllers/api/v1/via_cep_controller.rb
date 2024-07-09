class Api::V1::ViaCepController < ApplicationController
  before_action :authenticate_user!

  def search
    address = ViaCepService.get_address(params[:cep])
    render json: address
  end
end
