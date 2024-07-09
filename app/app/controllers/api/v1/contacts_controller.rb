class Api::V1::ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    @contacts = current_user.contacts.order.order(:name).page(params[:page]).per(params[:per_page]) || 10

    if params[:cpf].present?
      @contacts = @contacts.where(cpf: params[:cpf])
    elsif params[:name].present?
      @contacts = @contacts.where('name ILIKE ?', "%#{params[:name]}")
    end
    render json: @contacts
  end

  def show
    render json: @contact
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    geocoder_address(@contact)

    if @contact.save
      render json: { message: 'Contact created successfully', contact: @contact }, status: :created
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @contact.update(contact_params)
      render json: { message: 'Contact updated successfully', contact: @contact }
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @contact.destroy
    head :no_content
  end

  private

  def geocoder_address(contact)
    results = Geocoder.search(contact.address)

    if results.any?
      contact.latitude = results.first.latitude
      contact.longitude = results.first.longitude
    end
  end

  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :cpf, :phone, :address, :latitude, :longitude)
  end
end
