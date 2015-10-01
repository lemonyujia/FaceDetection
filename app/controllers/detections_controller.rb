class DetectionsController < ApplicationController

  before_action :authenticate_user!, except: [:edit]

  def create
    @detection = current_user.detections.build #safe_create_params
    @detection.detect_face
    if @detection.save
       redirect_to @detection
    else
      render 'new'
    end
  end

  def new
    @detection = Detection.new
  end

  def show
    @detection = Detection.find(params[:id])
  end

  def destroy
    @detection = Detection.find(params[:id])
    @detection.destroy

    redirect_to detections_path
  end

  #private

  #def safe_create_params
  #  params.require(:detection).permit(:image)
  #end

end
