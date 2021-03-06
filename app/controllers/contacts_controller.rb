class ContactsController < ApplicationController
  def new
  end
  
  def create
  @contact=Contact.new(contact_params)
  @contact.save
  redirect_to @contact
  end
 
  def show
  @contact=Contact.find(params[:id])
  end
  
 
  def index
  @contacts=Contact.all
  end

  def edit
  @contact=Contact.find(params[:id])
  end

  def update
  @contact = Contact.find(params[:id])
 
  if @contact.update(contact_params)
   redirect_to @contact
  else
    render 'edit'
  end
  end

  def destroy
  @contact=Contact.find(params[:id])
  @contact.destroy
  redirect_to contacts_path
  end

  private
	def contact_params
	params.require(:contact).permit(:FirstName, :LastName, :EmailId, :MobileNumber, :Address)
	end
end
