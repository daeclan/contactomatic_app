class Api::ContactsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @contacts = Contact.all
    render "index.json.jb"
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      user_id: current_user.id,
    )
    @contact.save
    render "show.json.jb"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name] || @contact.first_name,
                          @contact.last_name = params[:last_name] || @contact.last_name,
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number,
    @receipe.save
    render "show.json.jb"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: { message: "You have removed the contact." }
  end
end
