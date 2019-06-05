##CRUD ==>CREATE, READ , UPDATE, DESTROY

class ControllersController < ApplicationController
  
  def new ##POST ==> Sends user an empty form to fill out and return for #create
    @controller = Controller.new
    render :new #optional. Ryan says do anyway.
    ##render json: controller ==> outputs hashes 
  end 

  def edit ##PATCH ==> Sends user a form to fill out and return for #update
    @controller = Controller.find(params[:id])
    render :edit
  end 

  def index ##GET ==> Displays list of all instances and their values.
    @controllers = Controller.all
    render :index
  end

  def show ##GET ==> Displays  ==> Displays specific instance of Model at :id.
    @controller = Controller.find(params[:id])
    render :show
  end

  def create ##POST ==> Called by :new when "submit" is pressed
    @controller = Controller.new(controller_params)
    if @controller.save ##
      redirect_to controller_url(@controller) ##go to controller#show view
    else
      render json: @controller.errors.full_messages, status: 418  ## ==>I'm a teapot
    end
  end

  def update ##PATCH ==> Called by :edit when "submit" is pressed
    @controller = Controller.find(params[:id])

    if @controller.update_attributes(controller_params)
      redirect_to controller_url(@controller) ##go to controller#show view
    else
      render json: @controller.errors.full_messages, status:418 #error number
    end
  end
 
  def destroy ##Destroy ==> Deletes instance off database.
    @controller = Controller.find(params[:id])
    @controller.destroy
    redirect_to controllers_url #go to index
  end

  private
  def controller_params ##protects server from bad requests.
    params.require(:controller).permit(:what, :you, :will, :accept, :as, :parameters)
  end
  
end