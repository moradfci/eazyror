class AddLocationWorker
  include Sidekiq::Worker
  # sidekiq_options retry:false
  def perform(trip_params)
    trip_params=JSON.parse(trip_params)
    # historys=History.new(trip_params[:trip_id],trip_params[:latest_long],trip_params[:latest_lat]);
    historys=History.new(trip_params);

    # destenation=Trip.find(historys.trip_id);
    # render json: {status:'Success',message:'Trip created', data:destenation}, status: :ok


    if historys.save
  render json: {status:'Success',message:'history created', data:historys}, status: :ok
   else
     render json: {status:'error saving trip',message:'Error', data:historys.errors}, status: :upprocessable_entity
   end



  end


end
