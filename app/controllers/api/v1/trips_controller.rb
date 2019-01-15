	module Api
	module V1
	class TripsController < ApplicationController
	# ///////////////////////////
	def index
	  # AddLocationWorker.perform_async("14-01-2019","15-01-2019")
			trips=Trip.order('id DESC');
			render text: "a request has been add"
	# render json: {status:'Success',message:'trips loaded', data:trips}, status: :ok
	end
	# ////////////////////
	def show
			trip=Trip.find(params[:id]);
			render json: {status:'Success',message:'trips loaded', data:trip}, status: :ok
	end
	# ///////////////////////////
	def create
			trip=Trip.new(trip_params);
			if trip.save
			
				render json: {status:'Success',message:'Trip created', data:trip}, status: :ok
			else
			
				render json: {status:'error saving trip',message:'Error', data:trip.errors}, status: :upprocessable_entity
			end

	end
	# ////////////////////////
	def destroy
		trip=Trip.find(params[:id]);
		trip.destroy
		render json: {status:'Success',message:'Trip deleted', data:trip}, status: :ok

	end
	# ////////////////////////////////
	def update
		trip=Trip.find(params[:id]);

		if trip.update_attributes(trip_params)
		
			render json: {status:'Success',message:'Trip created', data:trip}, status: :ok
	 
		else
		
			render json: {status:'error saving trip',message:'Error', data:trip.errors}, status: :upprocessable_entity
		
		end

	end


	# ///////////////////////////////
	def update_status
		trip=Trip.find(params[:id]);
		
		if trip.status=='planned' && trip_status.status=='ongoing'
		
			if trip.update_attributes(trip_status)
			
				render json: {status:'Success',message:'Trip status updated', data:trip}, status: :ok
			else
			
				render json: {status:'error saving trip',message:'Error', data:trip.errors}, status: :upprocessable_entity
			end
			
		elsif trip.status=='ongoing' && trip_status.status=='completed'
	  
			if trip.update_attributes(status)
			
				render json: {status:'Success',message:'Trip status updated', data:trip}, status: :ok
	  
			else
				render json: {status:'error saving trip',message:'Error', data:trip.errors}, status: :upprocessable_entity
			end
		else

		end

	end



	private
	def trip_params
	  
	  params.permit(:status, :start_long, :start_lat, :destination_long, :destenation_lat)
	
	end
	def trip_status
	
	  params.permit(:status)
	
	end


	end
	end
	end
