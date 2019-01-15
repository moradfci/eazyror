module Api
module V1
class HistoriesController < ApplicationController
# //////////////////////
def index
 historys=History.order('id DESC');
render json: {status:'Success',message:'trips loaded', data:historys}, status: :ok
end
# ///////////////////
def show
 historys=History.find(params[:id]);
render json: {status:'Success',message:'trips loaded', data:historys}, status: :ok
end
# ////////////////////////////
def create
    AddLocationWorker.perform_async(trip_params)
    # historys=History.new(trip_params);
    # destenation=Trip.find(historys.trip_id);
    # render json: {status:'Success',message:'Trip created', data:destenation}, status: :ok

    # render json: {status:'Success',message:'history created', data:historys}, status: :ok

      #   if historys.save
      # render json: {status:'Success',message:'history created', data:historys}, status: :ok
      #  else
      #    render json: {status:'error saving trip',message:'Error', data:historys.errors}, status: :upprocessable_entity
      #  end




end
# ////////////////////////
def destroy
 historys=History.find(params[:id]);
  historys.destroy
render json: {status:'Success',message:'Trip deleted', data:historys}, status: :ok

end
# ////////////////////////////////
def update
 historys=History.find(params[:id]);
 if trip.update_attributes(trip_params)
render json: {status:'Success',message:'Trip created', data:historys}, status: :ok
 else
   render json: {status:'error saving trip',message:'Error', data:trip.errors}, status: :upprocessable_entity
 end

end
def report
  repo=Trip.Histroy.find(trip_id=>params[:id]);
  render json: {status:'Success',message:'report viewed', data:repo}, status: :ok
end

# ///////////////////////////////
private
def trip_params
  params.permit(:trip_id, :latest_long, :latest_lat)
end


end
end
end
